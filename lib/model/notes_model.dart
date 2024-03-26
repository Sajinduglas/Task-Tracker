import 'package:hive_flutter/hive_flutter.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 1)
class NotesModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  String description;
  @HiveField(2)
  String date;
  @HiveField(3)
  int category;

  NotesModel(
      {required this.title,
      required this.description,
      required this.category,
      required this.date});
}
