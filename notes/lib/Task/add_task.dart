import 'package:flutter/material.dart';

class Task {
  final String title;
  bool isDone;
  final String id;

  Task({required this.title, required this.id, this.isDone = false});
}

class TaskManager with ChangeNotifier {
  final List<Task> _taskList = <Task>[];

  List<Task> get taskList => _taskList;

  void addTask(String title) {
    final newTask = Task(title: title, id: DateTime.now().toString());
    _taskList.add(newTask);
    notifyListeners();
  }

  void toggleTask(int index) {
    if (index >= 0 && index < _taskList.length) {
      _taskList[index].isDone = !_taskList[index].isDone;
    }
    notifyListeners();
  }

  void deleteTask(String id) {
    _taskList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(String id, String newTitle) {
    final index = _taskList.indexWhere((task) => task.id == id);
    if (index != -1) {
      _taskList[index] = Task(
        title: newTitle,
        id: id,
        isDone: _taskList[index].isDone,
      );
    }
    notifyListeners();
  }
}
