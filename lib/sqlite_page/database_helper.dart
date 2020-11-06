import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_test/sqlite_page/employee_model.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, "employee_manager.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Employee('
          'id INTEGER PRIMARY KEY,'
          'email TEXT,'
          'firstName TEXT,'
          'lastName TEXT,'
          'avatar TEXT'
          ')');
    });
  }

  createEmplyee(EmployeeModel newEmployeeModel) async {
    await deleteAllEmployee();
    final db = await database;
    final res = await db.insert("Employee", newEmployeeModel.toJson());
    return res;
  }

  Future<int> deleteAllEmployee() async {
    final db = await database;
    final res = await db.rawDelete("DELETE FROM Employee");
    return res;
  }

  Future<List<EmployeeModel>> getAllEmployees() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Employee");

    List<EmployeeModel> list = res.isNotEmpty
        ? res.map((e) => EmployeeModel.fromJson(e)).toList()
        : [];

    return list;
  }
}
