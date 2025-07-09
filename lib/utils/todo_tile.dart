import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName; 
  final bool isTaskDone; 
  final Function(bool?)? onChanged; 

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.isTaskDone,
    this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(color: Colors.yellow),
        child: Row(
          children: [
            Checkbox(value: isTaskDone, onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(decoration: isTaskDone ? TextDecoration.lineThrough : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}