// import 'package:flutter/material.dart';
//
// class NoteWidget extends StatelessWidget {
//   const NoteWidget(
//       {super.key,
//       required this.title,
//       required this.description,
//       required this.date,
//       required this.category,
//       this.onDelete,
//       this.onUpdate});
//
//   final String title;
//   final String description;
//   final String date;
//   final String category;
//   final void Function()? onDelete;
//   final void Function()? onUpdate;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       width: 400,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ListTile(
//             title: Text(title),
//             trailing: Wrap(
//               children: [
//                 IconButton(
//                   onPressed: onUpdate,
//                   icon: Icon(
//                     Icons.edit,
//                     color: Colors.white,
//                   ),
//                 ),
//                 IconButton(
//                   onPressed: onDelete,
//                   icon: Icon(
//                     Icons.delete,
//                     color: Colors.white,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             description,
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             style: TextStyle(color: Colors.white),
//           ),
//           ListTile(
//             title: Text(
//               date,
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.white),
//             ),
//             trailing: Text(
//               date,
//               maxLines: 3,
//               overflow: TextOverflow.ellipsis,
//               style: TextStyle(color: Colors.white),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';


import '../../../controller/category_controller.dart';
import '../../note_page.dart';

class NoteWidgets extends StatelessWidget {
  const NoteWidgets(
      {super.key,
        required this.title,
        required this.description,
        required this.date,
        required this.onDelete,
        required this.onUpdate,
        required this.category});

  final String title;
  final String description;
  final String date;
  final String category;
  final void Function()? onDelete;
  final void Function()? onUpdate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotePage(
                  title: title,
                  description: description,
                  date: date,
                  category: category),
            )),
        child: Container(
          height: 200,
          width: MediaQuery.sizeOf(context).width - 80,
          decoration: BoxDecoration(
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Row(
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
                    ],
                  ),
                  Text(
                    description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      onPressed: () {
                        String note =
                            "$title \n\n $description \n \n                          $date";
                        NotesController().shareNote(Note: note);
                      },
                      icon: Icon(
                        Icons.share,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
