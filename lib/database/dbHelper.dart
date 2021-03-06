import 'package:sqflite/sqflite.dart';
import 'package:state_managment_gsg/models/task.dart';

class DBHelper {
  DBHelper._();
  static DBHelper dbHelper = DBHelper._();
  Database database;
  static final String dbName = '/toDoDb.db';
  static final String tableName = 'tasks';
  static final String columnId = 'id';
  static final String columnName = 'name';
  static final String columnIsComplete = 'iscomplete';

  Future<Database> initDataBase() async {
    if (database == null) {
      return await createDataBase();
    } else {
      return database;
    }
  }

  createDataBase() async {
    try {
      String dbPath = await getDatabasesPath();
      String path = dbPath + dbName;
      Database database = await openDatabase(path, version: 1,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE $tableName ($columnId INTEGER PRIMARY KEY AUTOINCREMENT , $columnName TEXT, $columnIsComplete INTEGER)');
      });
      return database;
    } catch (e) {
      print(e);
    }
  }

  insertTask(Task task) async {
    try {
      await database.insert(tableName, task.toJson());
    } catch (e) {
      print(e);
    }
  }

  Future<List<Task>> getAllTasks() async {
    try {
      List<Map> resault = await database.query(tableName);
      List<Task> tasks = resault.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  Future<List<Task>> getTaskType(int isComplete) async {
    try {
      List<Map> resault = await database.query(tableName,
          where: '$columnIsComplete=?', whereArgs: [isComplete]);
      List<Task> tasks = resault.map((e) => Task.fromJson(e)).toList();
      return tasks;
    } catch (e) {
      print(e);
    }
  }

  updateTask(Task task) async {
    try {
      database.update(tableName, task.toJson(),
          where: '$columnId=?', whereArgs: [task.id]);
    } catch (e) {}
  }

  deleteTask(Task task) async {
    try {
      database.delete(tableName, where: '$columnId=?', whereArgs: [task.id]);
    } catch (e) {}
  }
}
