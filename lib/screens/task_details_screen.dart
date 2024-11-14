import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/task_controller.dart';
import '../models/task_model.dart';

class TaskDetailsScreen extends StatelessWidget {
  final Task task;

  TaskDetailsScreen({required this.task});

  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    // Determine the color for the priority tag
    Color priorityColor;
    if (task.priority == 'High') {
      priorityColor = Colors.red;
    } else if (task.priority == 'Medium') {
      priorityColor = Colors.yellow;
    } else {
      priorityColor = Colors.green;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero animation for smooth transition
            Hero(
              tag: task
                  .id, // Use task id as the unique tag for the Hero animation
              child: Material(
                color: Colors.transparent,
                child: Text(
                  task.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              task.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 16),
            Row(
              children: [
                // Priority tag
                Chip(
                  label: Text(task.priority),
                  backgroundColor: priorityColor,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Spacer(),
                // Mark as completed button
                IconButton(
                  icon: Icon(
                    task.isCompleted.value
                        ? Icons.check_circle
                        : Icons.circle_outlined,
                  ),
                  onPressed: () {
                    taskController.toggleCompletion(task.id);
                    Get.back(); // Go back to the home screen after marking as completed
                  },
                ),
              ],
            ),
            Spacer(),
            // Delete task button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  taskController.removeTask(taskController.tasks.indexOf(task));
                  Get.back(); // Go back to the home screen after deleting the task
                },
                child: const Text('Delete Task'),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.red, // Red background for delete button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
