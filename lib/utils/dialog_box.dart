import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller; 
  final VoidCallback? onSave; 
  const DialogBox({super.key, required this.controller, this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: SizedBox(
        height: 120, 
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add a new task",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    onSave?.call();
                  },
                  child: Text("Add"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}