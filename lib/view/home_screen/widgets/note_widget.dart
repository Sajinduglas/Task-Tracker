import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.date,
      required this.category,
      this.onDelete,
      this.onUpdate});

  final String title;
  final String description;
  final String date;
  final String category;
  final void Function()? onDelete;
  final void Function()? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListTile(
            title: Text(title),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: onUpdate,
                  icon: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.white),
          ),
          ListTile(
            title: Text(
              date,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
            trailing: Text(
              date,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
