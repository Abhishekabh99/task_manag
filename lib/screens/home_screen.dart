import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manag/screens/task_details_screen.dart';
import '../controllers/task_controller.dart';

import 'add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Manager'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: taskController.tasks.length,
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return Dismissible(
              key: ValueKey(task.id), // Use ValueKey if task.id is a String
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                taskController.removeTask(index); // Remove the task
                Get.snackbar(
                  "Task Deleted",
                  "Task has been deleted.",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              background: Container(
                color: Colors.red,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Icon(Icons.delete, color: Colors.white),
                  ),
                ),
              ),
              child: ListTile(
                title: Text(task.title),
                subtitle: Text(task.description),
                trailing: Obx(() {
                  return Checkbox(
                    value: task.isCompleted
                        .value, // Bind the checkbox to the reactive value
                    onChanged: (bool? value) {
                      taskController.toggleCompletion(
                          task.id); // Toggle the completion state
                    },
                  );
                }),
                onTap: () {
                  Get.to(TaskDetailsScreen(task: task));
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(AddTaskScreen()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
