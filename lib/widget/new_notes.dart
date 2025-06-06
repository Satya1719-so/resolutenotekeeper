import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:expencetracker/widget/Notess_list/Notesdata.dart';
import 'package:flutter/rendering.dart';
import 'package:notekeeper/widget/notelist/notesdata.dart';

class NewNotes extends StatefulWidget {
  const NewNotes({super.key, required this.onAddNotes});
  final void Function(Notesdata Notes) onAddNotes;

  @override
  State<NewNotes> createState() => _NewNotesState();
}

class _NewNotesState extends State<NewNotes> {
  final _titleController = TextEditingController();
  final _NotesController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCatagory = Category.High;
  void _presentDatepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickeddate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickeddate;
    });
  }

  void showDialouge() {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder:
            (ctx) => CupertinoAlertDialog(
              title: Text('invalid input'),
              content: Text('hjh'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
              ],
            ),
      );
    } else {
      showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text('invalid input'),
              content: Text('hjh'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
              ],
            ),
      );
    }
  }

  void _submitNotes() {
    // final eteramount = double.tryParse(_NotesController.text);
    //final amountisinvalid = eteramount == null || eteramount <= 0;
    if (_titleController.text.trim().isEmpty ||
        //   amountisinvalid ||
        _selectedDate == null) {
      showDialouge();
      return;
    }
    widget.onAddNotes(
      Notesdata(
        amount: _NotesController.text,
        date: _selectedDate!,
        title: _titleController.text,
        category: _selectedCatagory,
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _titleController.dispose();
    _NotesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardspace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (ctx, constraints) {
        print(constraints.minHeight);
        final width = constraints.maxWidth;
        return SafeArea(
          child: SizedBox(
            height: double.infinity, // it will take as much height as possible
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardspace + 16),
                child: Column(
                  children: [
                    if (width >= 600)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _titleController,
                              decoration: InputDecoration(label: Text('Title')),
                            ),
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: TextField(
                              controller: _NotesController,
                              decoration: InputDecoration(
                                label: Text('Notes'),
                                prefixText: '#',
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      TextField(
                        controller: _NotesController,
                        maxLines: 5,
                        decoration: InputDecoration(label: Text('Notes')),
                      ),
                    if (width >= 600)
                      Row(
                        children: [
                          DropdownButton(
                            value: _selectedCatagory,
                            items:
                                Category.values
                                    .map(
                                      (category) => DropdownMenuItem(
                                        value: category,
                                        child: Text(
                                          category.name.toUpperCase(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              // if (value == null) {
                              //   return;
                              // }
                              setState(() {
                                _selectedCatagory = value!;
                              });
                            },
                          ),
                          SizedBox(width: 24),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _selectedDate == null
                                      ? 'no dateSelected '
                                      : formated.format(_selectedDate!),
                                ),
                                IconButton(
                                  onPressed: _presentDatepicker,
                                  icon: Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _titleController,
                              maxLines: 1,
                              decoration: InputDecoration(
                                label: Text('Title'),
                                prefixText: '#',
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  _selectedDate == null
                                      ? 'no dateSelected '
                                      : formated.format(_selectedDate!),
                                ),
                                IconButton(
                                  onPressed: _presentDatepicker,
                                  icon: Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    SizedBox(width: 16),
                    if (width >= 600)
                      Row(
                        children: [
                          Spacer(),
                          ElevatedButton(
                            onPressed: _submitNotes,
                            child: Text('Save Notes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('cancel'),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          DropdownButton(
                            value: _selectedCatagory,
                            items:
                                Category.values
                                    .map(
                                      (category) => DropdownMenuItem(
                                        value: category,
                                        child: Text(
                                          category.name.toUpperCase(),
                                        ),
                                      ),
                                    )
                                    .toList(),
                            onChanged: (value) {
                              // if (value == null) {
                              //   return;
                              // }
                              setState(() {
                                _selectedCatagory = value!;
                              });
                            },
                          ),
                          Spacer(),
                          ElevatedButton(
                            onPressed: _submitNotes,
                            child: Text('Save Notes'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('cancel'),
                          ),
                        ],
                      ),
                    // TextButton(onPressed: () {}, child: Text('cancel')),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
