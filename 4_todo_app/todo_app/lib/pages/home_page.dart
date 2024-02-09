import "package:flutter/material.dart";
import "package:hive_flutter/hive_flutter.dart";
import "package:todo_app/data/database.dart";
import "package:todo_app/util/dialog_box.dart";
import "package:todo_app/util/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference hive box
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the first time opening that app, then create defualt data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
      print(db.toDoList);
    }
      

    super.initState();
  }

  // text controller
  final _textController = TextEditingController();

  // checkbox tapped
  void checkBoxChanged(bool? value, int index) {
    List movedTask = db.toDoList.elementAt(index);

    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];

      if(db.toDoList[index][1] == true){
        db.toDoList.removeAt(index);
        db.toDoList.insert(db.toDoList.length, movedTask);
      }

    });
    db.upateDatabase();
  }

  // add new task
  void addNewTask() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        // db.toDoList.insert(0, [_textController.text, false, false]);
        db.toDoList.add([_textController.text, false, false]);
        _textController.clear();
      });
      db.upateDatabase();
    }

    Navigator.of(context).pop();
  }

  // create a new task

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _textController,
            onSave: addNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.upateDatabase();
  }

  // starred task
  void starredTask(int index){
    List movedTask = db.toDoList.elementAt(index);
    print(movedTask);
    setState(() {
      db.toDoList[index][2] = !db.toDoList[index][2];
      
      if(db.toDoList[index][2] == true && db.toDoList[index][1] == false){
        db.toDoList.removeAt(index);
        db.toDoList.insert(0, movedTask);
      } else if (db.toDoList[index][1] == false) {
        db.toDoList.removeAt(index);
        db.toDoList.insert(db.toDoList.length, movedTask);
      }
    });
    db.upateDatabase();
    print(db.toDoList[index][2]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('TO DO'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTaskFunction: (context) => deleteTask(index),
            toggleStared: db.toDoList[index][2],
            starredTaskFucntion: () => starredTask(index),
          );
        },
      ),
    );
  }
}
