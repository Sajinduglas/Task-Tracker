import 'package:hive/hive.dart';

class CategoryController {
  final categoryBox = Hive.box("Categories");

  void intializeApp() async {
    // List of default categories
    List<String> defaultCategories = ["work", "Personal", "Ideas"];
    // Check if categories already exist
    bool categoryExist = categoryBox.isNotEmpty;
// If default categories don't exist, add them
    if (!categoryExist) {
      for (String categoryName in defaultCategories) {
        categoryBox.add(categoryName);
      }
    }
  }

  // Function to get all categories
  List getAllCategories() {
    return categoryBox.values.toList();
  }

  void addUserCategory(String text) {}

  static void removeUserCategory({required int catindex, required void Function() fetchData}) {}
}
