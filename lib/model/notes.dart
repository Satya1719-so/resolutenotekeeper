import 'package:flutter/material.dart';
import 'package:notekeeper/widget/new_notes.dart';
import 'package:notekeeper/widget/notelist/notes_list.dart';
import 'package:notekeeper/widget/notelist/notesdata.dart';

class Notes extends StatefulWidget {
  //final void Function(Notesdata Notes) onAddNotes;
  const Notes({super.key});
  //final void Function(Notesdata Notes) onAddNotes;
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  final List<Notesdata> registerdummy = [
    Notesdata(
      amount: 'hi',
      date: DateTime.now(),
      title: 'hi',
      category: Category.VeryHigh,
    ),
    Notesdata(
      amount: "hi",
      date: DateTime.now(),
      title: 'hi',
      category: Category.High,
    ),
  ];
  void _openaddoverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (ctx) {
        return NewNotes(onAddNotes: addNotes);
      },
    );
  }

  void addNotes(Notesdata Notes) {
    setState(() {
      registerdummy.add(Notes);
    });
    // registerdummy.add(Notes);
  }

  void removeNotes(Notesdata Notes) {
    final Notesindex = registerdummy.indexOf(Notes);
    setState(() {
      registerdummy.remove(Notes);
    });
    // registerdummy.remove(Notes);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Notes deleted'),
        action: SnackBarAction(
          label: 'undo',
          onPressed: () {
            setState(() {
              registerdummy.insert(Notesindex, Notes);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    Widget maincontent = Center(child: Text(' no data'));
    if (registerdummy.isNotEmpty) {
      maincontent = NotessList(Notess: registerdummy, onRemove: removeNotes);
    }

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openaddoverlay,

            // showModalBottomSheet(
            //   context: context,
            //   builder: (BuildContext context) {
            //     return Text('hi satyaa');
            //   },
            // );
            // _openaddoverlay;
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body:
          width < 600
              ? Column(
                children: [
                  Expanded(
                    child: maincontent,
                    //    NotessList(
                    //     Notess: registerdummy,
                    //     onRemove: removeNotes,
                    //   ),
                  ),
                ],
              )
              : Row(
                children: [
                  Expanded(
                    child: maincontent,
                    //    NotessList(
                    //     Notess: registerdummy,
                    //     onRemove: removeNotes,
                    //   ),
                  ),
                ],
              ),
    );
  }
}
