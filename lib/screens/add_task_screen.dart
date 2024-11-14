import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  final TaskController taskController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final List<String> priorities = ['Low', 'Medium', 'High'];
  String selectedPriority = 'Low';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
            DropdownButton<String>(
              value: selectedPriority,
              onChanged: (value) {
                if (value != null) selectedPriority = value;
              },
              items: priorities.map((String priority) {
                return DropdownMenuItem<String>(
                  value: priority,
                  child: Text(priority),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  final task = Task(
                    id: DateTime.now().millisecondsSinceEpoch,
                    title: titleController.text,
                    description: descController.text,
                    priority: selectedPriority,
                  );
                  taskController.addTask(task);
                  Get.back(); // Navigate back to the home screen
                } else {
                  Get.snackbar("Error", "Task title cannot be empty",
                      snackPosition: SnackPosition.BOTTOM);
                }
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
