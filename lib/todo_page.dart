import 'package:flutter/material.dart';
import '../models/task.dart';
import '../widgets/task_tile.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController controller =
      TextEditingController();

  final List<Task> tasks = [];

  void addTask() {
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        tasks.add(
          Task(
            title: controller.text,
          ),
        );
      });

      controller.clear();
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index].completed =
          !tasks[index].completed;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        centerTitle: true,
        backgroundColor: Colors.yellow.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter a task",
                filled: true,
                fillColor: Colors.white,
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addTask,
                ),
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: tasks.isEmpty
                  ? const Center(
                      child: Text(
                        "No tasks yet!",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder:
                          (context, index) {
                        return TaskTile(
                          task: tasks[index],
                          onDelete: () =>
                              deleteTask(index),
                          onToggle: () =>
                              toggleTask(index),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton:
          FloatingActionButton(
        backgroundColor:
            Colors.yellow.shade700,
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
