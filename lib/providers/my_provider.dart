import 'package:flutter/material.dart';
import 'package:state_managment_gsg/models/task.dart';

class MyProvider extends ChangeNotifier {
  List<Task> tasks;
  setTasks(tasks) {
    this.tasks = tasks;
    notifyListeners();
  }
}
