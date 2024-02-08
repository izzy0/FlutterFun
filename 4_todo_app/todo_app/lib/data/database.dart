import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  // Todo list
  List toDoList = [];

  // ref the box
  final _myBox = Hive.box('myBox');

// run this method if thie is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Get Milk", false],
      ["Go to Gym", false],
    ];
  }

// load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

// updata the datebase
  void upateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
