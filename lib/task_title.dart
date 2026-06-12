import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  const TaskTile({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.yellow.shade200,
      margin: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: ListTile(
        leading: Checkbox(
          value: task.completed,
          onChanged: (_) {
            onToggle();
          },
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            decoration: task.completed
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
