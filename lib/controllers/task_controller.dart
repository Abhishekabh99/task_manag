import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/task_model.dart';

class TaskController extends GetxController {
  RxList<Task> tasks = <Task>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadTasks();
  }

  // Load tasks from SharedPreferences
  void _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskData = prefs.getString('tasks');
    if (taskData != null) {
      List<dynamic> decodedTasks = jsonDecode(taskData);
      tasks.value = decodedTasks.map((task) => Task.fromJson(task)).toList();
    }
  }

  // Save tasks to SharedPreferences
  void _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskData = jsonEncode(tasks.map((task) => task.toJson()).toList());
    prefs.setString('tasks', taskData);
  }

  // Add a new task
  void addTask(Task task) {
    tasks.add(task);
    _saveTasks();
  }

  // Remove a task
  void removeTask(int index) {
    tasks.removeAt(index);
    _saveTasks();
  }

  // Toggle task completion
  void toggleCompletion(int taskId) {
    final task = tasks.firstWhere((task) => task.id == taskId);
    task.isCompleted.value = !task.isCompleted.value;
    _saveTasks();
  }
}
