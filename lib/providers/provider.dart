import 'package:flutter/cupertino.dart';
import 'package:state_managment_gsg/database/dbHelper.dart';
import 'package:state_managment_gsg/models/task.dart';

class provider extends ChangeNotifier {
  provider() {
    getAllTasks();
  }
  String name = 'Ruba Fikri';

  changeName(String newName) {
    this.name = newName;
    notifyListeners();
  }

  List<Task> alltasks;
  List<Task> completetasks;
  List<Task> inCompletetasks;

  getAllTasks() async {
    this.alltasks = await DBHelper.dbHelper.getAllTasks();
    this.completetasks =
        this.alltasks.where((element) => element.isComplete).toList();
    this.inCompletetasks =
        this.alltasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertTask(Task task) async {
    await DBHelper.dbHelper.insertTask(task);
    getAllTasks();
  }

  updateTask(Task task) async {
    await DBHelper.dbHelper.updateTask(task);
    getAllTasks();
  }

  removeTask(Task task) async {
    await DBHelper.dbHelper.deleteTask(task);
    getAllTasks();
  }
}
