import 'package:flutter/material.dart';
import 'package:notekeeper/widget/notelist/notesdata.dart';

class NotessItem extends StatelessWidget {
  const NotessItem(this.Notes, {super.key});
  final Notesdata Notes;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Text(Notes.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text('${Notes.amount}'),
                //12.3333 is shows 12.33
                Spacer(),
                Row(
                  children: [
                    Icon(CatagoryIcon[Notes.category]),
                    SizedBox(width: 8),
                    Text(Notes.formattedDate),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
