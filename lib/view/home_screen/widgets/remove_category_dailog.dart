import 'package:flutter/material.dart';
import 'package:task_tracker/controller/main_controller.dart';

class RemoveCategoryDailog extends StatelessWidget {
  RemoveCategoryDailog(
      {super.key,
      required this.fetchData,
      required this.categoryName,
      required this.categoryIndex});

  String categoryName;
  int categoryIndex;
  final void Function() fetchData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Delete ${categoryName}"),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("cancel"),
          color: Colors.grey,
          shape: OutlineInputBorder(),
        ),
        MaterialButton(
          onPressed: () {
           print(categoryName);
           print(categoryIndex);
           CategoryController.removeUserCategory(catindex:categoryIndex,fetchData:fetchData);
           Navigator.pop(context);
          },
          child: Text("Delete"),
          color: Colors.grey,
          shape: OutlineInputBorder(),
        )
      ],
    );
  }
}
