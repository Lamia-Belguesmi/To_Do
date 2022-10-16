import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  final _myBox = Hive.box("MyBox");

  void createInitialData() {
    toDoList = [
      ["Do Homework", false],
      ["Go To Gym", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
