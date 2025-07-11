import 'package:flutter/material.dart';
import 'package:to_do_list_app/utils/dialog_box.dart';
import 'package:to_do_list_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> toDoList = [];

  void checkBoxChanged(bool? value, int index) { 
    setState(() => toDoList[index][1] = !toDoList[index][1]);
  }

  void addTask() { 
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() { 
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(controller: _controller, onSave: () => addTask()); 
      }
    );
  }

  void deleteTask(BuildContext context, int index) {
    setState(() => toDoList.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("TO DO")
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            isTaskDone: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            onDelete: (context) => deleteTask(context, index)
          );
        },
      ),
    );
  }
}