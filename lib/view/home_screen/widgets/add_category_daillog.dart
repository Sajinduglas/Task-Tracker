import 'package:flutter/material.dart';
import 'package:task_tracker/controller/main_controller.dart';

class AddCategoryDailog extends StatelessWidget {
  const AddCategoryDailog(
      {super.key,
      required this.categoryController,
      required this.catController,
      required this.fetchData});

  final TextEditingController categoryController;
  final CategoryController catController;
  final void Function() fetchData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Category"),
      content: TextField(
        controller: categoryController,
        maxLines: 1,
        decoration: InputDecoration(
            labelText: "Category",
            labelStyle: TextStyle(color: Colors.black87),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 10,
                )),
            isDense: false),
      ),
      actions: [
        SizedBox(
          width: 200,
          child: ElevatedButton(
              onPressed: () {
                categoryController
                    .clear(); //testeditingcontroller  il ulla values clear akann
                Navigator.pop(context);
              },
              child: Text("close")),
        ),
        ElevatedButton(
            onPressed: () {
              catController.addUserCategory(categoryController.text);
              categoryController.clear();
              Navigator.pop(context);
            },
            child: Text("Add"))
      ],
    );
  }
}
/// not completed ui design ondu