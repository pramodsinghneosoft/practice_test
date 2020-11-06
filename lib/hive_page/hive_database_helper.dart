import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_test/hive_page/hive_model.dart';

class HiveDatabaseHelper {
  static final HiveDatabaseHelper hiveDatabaseHelper = HiveDatabaseHelper._();
  Box box;

  HiveDatabaseHelper._();

  void initDB() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  insertData(HiveUserModel hiveUserModel) async {
    initDB();
    box = await Hive.openBox("employee_db");
    box.put("key", userModelToJson);
  }

  Future<List<HiveUserModel>> readData() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox("employee_db");
    List<Map<String, dynamic>> boxList = box.get("key");
    List<HiveUserModel> list = [];
    if (boxList != null) {
      list = boxList.map((e) => HiveUserModel.fromJson(e)).toList();
      return list;
    }
  }
}
