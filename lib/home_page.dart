import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/data/database.dart';
import 'package:to_do_app/util/dialog_box.dart';
import 'package:to_do_app/util/to_do_list.dart';


import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("MyBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();

  void CheckBoxChange(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
  }

  void CreateNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: SaveNewTask,
            onCancel: () {
              Navigator.of(context).pop();
            },
          );
        });
  }

  void SaveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBgColor,
        appBar: AppBar(
          backgroundColor: kTextColor,
          title: Center(
            child: Text(
              " TO DO 🖊️ ",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kTextColor,
          onPressed: CreateNewTask,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoList(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) {
                CheckBoxChange(value, index);
              },
              deleteFunction: (context) {
                deleteTask(index);
              },
            );
          },
        ),
      ),
    );
  }
}
