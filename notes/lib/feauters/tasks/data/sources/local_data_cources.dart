import 'dart:convert';

import 'package:notes/feauters/tasks/data/model/task_model.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LocalDataCources {
  final String _tasksKay = 'tasks';

  Future<List<TaskModel>> getTasks() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> taskListJson = prefs.getStringList(_tasksKay) ?? [];

    final List<TaskModel> resultList = taskListJson
        .map((jsonString) => TaskModel.fromJson(jsonDecode(jsonString)))
        .toList();

    return resultList;
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<String> taskListJson =
        tasks.map((task) => jsonEncode(task.toJson())).toList();

    await prefs.setStringList(_tasksKay, taskListJson);
  }
}
