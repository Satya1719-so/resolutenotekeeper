import 'package:flutter/material.dart';
import 'package:notekeeper/widget/notelist/notes_item.dart';
import 'package:notekeeper/widget/notelist/notesdata.dart';

class NotessList extends StatelessWidget {
  const NotessList({super.key, required this.Notess, required this.onRemove});
  final List<Notesdata> Notess;
  final void Function(Notesdata Notes) onRemove;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Notess.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(Notess[index]),
          onDismissed: (direction) {
            onRemove(Notess[index]);
          },
          child: NotessItem(Notess[index]),
        );
        //Text(Notess[index].title);
      },
    );
  }
}
