import 'package:flutter/material.dart';

import '../../controller/main_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // adding/editing form key
  final _formKey = GlobalKey<FormState>();

  // adding/editing form controllers
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

// category list from hive category box
  List categories = [];

  //category controller object
  CategoryController catController = CategoryController();

  @override
  void initState() {
    catController.intializeApp();
    categories = catController.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            bottomSheet(context);
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.grey,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(width: 10))),
    );
  }

  Future<void> bottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (context) => StatefulBuilder(//setstate vilichu all widget rebuild cheyanda  statefullbuilder vilicha particular widget mathremain rebuild aku
            builder: (context, setState) => Padding(
                  //setstate means aa widget inte setstate
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: SingleChildScrollView(
                    child: Container(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                maxLines: 1,
                                controller: titleController,
                                decoration: InputDecoration(
                                    labelText: "Title",
                                    labelStyle: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 10)),
                                    isDense: false,
                                    label: Text("Title")),
                              ),
                              SizedBox(
                                height: 150,
                                child: TextFormField(
                                  maxLines: null,
                                  expands: true,
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                      hintText: "Description",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              width: 5,
                                              color: Colors.black87))),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text("Category"),
                              SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                child: Row(
                                  children: [],
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                )));
  }
}
