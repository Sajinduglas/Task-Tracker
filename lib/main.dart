// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:task_tracker/view/splash_screen.dart';
//
// Future <void> main()async{
//    WidgetsFlutterBinding.ensureInitialized();
//    await Hive.initFlutter();
//    var categoryBox=await Hive.openBox("Categories");
//
//    var noteBox=await Hive.openBox("Notebox");
//    runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task_tracker/view/home_screen/home_page.dart';
import 'package:task_tracker/view/splash_screen.dart';

import 'model/notes_model.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  var catBox = await Hive.openBox('categories');
  Hive.registerAdapter(NotesModelAdapter());
  var box = await Hive.openBox('noteBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
