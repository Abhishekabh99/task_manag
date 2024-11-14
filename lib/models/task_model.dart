import 'package:get/get.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final String priority;
  RxBool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    bool isCompleted = false,
  }) : isCompleted = RxBool(isCompleted);

  // Convert a Task to a map for JSON encoding
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'isCompleted': isCompleted.value,
    };
  }

  // Create a Task from a map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
      isCompleted: json['isCompleted'],
    );
  }
}
