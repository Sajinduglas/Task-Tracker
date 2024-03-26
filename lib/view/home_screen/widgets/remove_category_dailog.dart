// import 'package:flutter/material.dart';
// import 'package:task_tracker/controller/category_controller.dart';
//
// class RemoveCategoryDailog extends StatelessWidget {
//   RemoveCategoryDailog(
//       {super.key,
//       required this.fetchData,
//       required this.categoryName,
//       required this.categoryIndex});
//
//   String categoryName;
//   int categoryIndex;
//   final void Function() fetchData;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Delete ${categoryName}"),
//       actions: [
//         MaterialButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text("cancel"),
//           color: Colors.grey,
//           shape: OutlineInputBorder(),
//         ),
//         MaterialButton(
//           onPressed: () {
//            print(categoryName);
//            print(categoryIndex);
//            CategoryController.removeUserCategory(catindex:categoryIndex,fetchData:fetchData);
//            Navigator.pop(context);
//           },
//           child: Text("Delete"),
//           color: Colors.grey,
//           shape: OutlineInputBorder(),
//         )
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';


import '../../../controller/category_controller.dart';
import '../../../utils/color_constants.dart';

class RemoveCategoryDialog extends StatelessWidget {
  RemoveCategoryDialog(
      {super.key,
        required this.categoryName,
        required this.categoryIndex,
        required this.fetchData});
  String categoryName;
  int categoryIndex;
  final void Function() fetchData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Dlete $categoryName ?"),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
              MaterialStatePropertyAll(ColorConstants.primaryColor)),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(ColorConstants.primaryColor)),
            onPressed: () {
              print(categoryIndex);
              print(categoryName);
              CategoryController().removeUserCategory(
                  catIndex: categoryIndex, fetchData: fetchData);
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("$categoryName deleted success full")));
              fetchData();
            },
            child: Text("Delete"))
      ],
    );
  }
}

