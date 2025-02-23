import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/models/task_model.dart';

class Settings {
  static final String _userKey = 'userNameKey';
  static final _tasksKey = 'tasksKey';

  static Future<String?> getUserName() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_userKey);
  }

  static Future<void> setUserName(String name) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_userKey, name);
  }

  static Future<List<TaskModel>> getTasks() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final tasks = preferences.getStringList(_tasksKey);
    List<TaskModel> realTask =
        tasks?.map((t) => TaskModel.fromMap(jsonDecode(t))).toList() ?? [];
    return realTask;
  }

  static Future<void> setTask(TaskModel task) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final tasks = preferences.getStringList(_tasksKey);
    List<TaskModel> realTask =
        tasks?.map((t) => TaskModel.fromMap(jsonDecode(t))).toList() ?? [];
    realTask.add(task);
    List<String> storeList =
        realTask.map((t) => jsonEncode(t.toMap())).toList();
    preferences.setStringList(_tasksKey, storeList);
  }

  static Future<void> editTask(TaskModel task) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final tasks = preferences.getStringList(_tasksKey);
    List<TaskModel> realTask =
        tasks?.map((t) => TaskModel.fromMap(jsonDecode(t))).toList() ?? [];
    realTask = realTask.map((t) => t.id == task.id ? task : t).toList();

    List<String> storeList =
        realTask.map((t) => jsonEncode(t.toMap())).toList();
    preferences.setStringList(_tasksKey, storeList);
  }

  // static Future<void> deleteTask(TaskModel id) async
  // {
  // final SharedPreferences preferences = await SharedPreferences.getInstance();

  // }
}
