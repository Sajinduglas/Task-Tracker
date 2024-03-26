// import 'package:flutter/material.dart';
// import 'package:task_tracker/controller/category_controller.dart';
//
// class AddCategoryDailog extends StatelessWidget {
//   const AddCategoryDailog(
//       {super.key,
//       required this.categoryController,
//       required this.catController,
//       required this.fetchData});
//
//   final TextEditingController categoryController;
//   final CategoryController catController;
//   final void Function() fetchData;
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text("Add Category"),
//       content: TextField(
//         controller: categoryController,
//         maxLines: 1,
//         decoration: InputDecoration(
//             labelText: "Category",
//             labelStyle: TextStyle(color: Colors.black87),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide(
//                   width: 10,
//                 )),
//             isDense: false),
//       ),
//       actions: [
//         SizedBox(
//           width: 200,
//           child: ElevatedButton(
//               onPressed: () {
//                 categoryController
//                     .clear(); //testeditingcontroller  il ulla values clear akann
//                 Navigator.pop(context);
//               },
//               child: Text("close")),
//         ),
//         ElevatedButton(
//             onPressed: () {
//               catController.addUserCategory(categoryController.text);
//               categoryController.clear();
//               Navigator.pop(context);
//             },
//             child: Text("Add"))
//       ],
//     );
//   }
// }
// /// not completed ui design ondu

import 'package:flutter/material.dart';

import '../../../controller/category_controller.dart';
import '../../../utils/color_constants.dart';

class AddCategoryDialog extends StatelessWidget {
  const AddCategoryDialog(
      {super.key,
      required this.categoryController,
      required this.catController,
      required this.fetchdata});

  final TextEditingController categoryController;
  final CategoryController catController;
  final void Function() fetchdata;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add category"),
      content: TextField(
        controller: categoryController,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: "Category",
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: ColorConstants.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(15),
          ),
          labelStyle: TextStyle(
            color: ColorConstants.primaryColor,
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: ColorConstants.primaryColor,
              )),
          isDense: false,
          // Added this
          contentPadding: const EdgeInsets.all(20),
        ),
      ),
      actions: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorConstants.primaryColor)),
            onPressed: () {
              categoryController.clear();
              Navigator.pop(context);
            },
            child: const Text("Close"),
          ),
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(ColorConstants.primaryColor)),
            onPressed: () {
              catController.addUserCategory(categoryController.text);
              categoryController.clear();
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Category added success full")));
              fetchdata();
            },
            child: const Text("Add"))
      ],
    );
  }
}
