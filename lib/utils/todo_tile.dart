import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName; 
  final bool isTaskDone; 
  final Function(bool?)? onChanged; 
  final Function(BuildContext)? onDelete;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.isTaskDone,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane (
          motion: const StretchMotion(),
          children: [ 
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10), 
                bottomRight: Radius.circular(10)
              ),
            )
          ]
        ),
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
      ),
    );
  }
}