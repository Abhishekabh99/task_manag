import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/task_model.dart';
import '../screens/task_details_screen.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => TaskDetailsScreen(task: task)),
      child: Card(
        child: ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: Icon(
            Icons.circle,
            color: task.priority == 'High'
                ? Colors.red
                : task.priority == 'Medium'
                    ? Colors.orange
                    : Colors.green,
          ),
        ),
      ),
    );
  }
}
