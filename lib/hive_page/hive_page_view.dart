import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_test/hive_page/hive_api_provider.dart';
import 'package:sqflite_test/hive_page/hive_database_helper.dart';
import 'package:sqflite_test/hive_page/hive_model.dart';

class HivePage extends StatefulWidget {
  @override
  _HivePageState createState() => _HivePageState();
}

class _HivePageState extends State<HivePage> {
  var hiveProvider = HiveApiProvider();
  HiveUserModel hiveusermodel;

  @override
  void initState() {
    super.initState();
    hiveusermodel = HiveUserModel();
    // getHiveDataLocal();
    hiveProvider.getHiveData();
  }

  getHiveDataLocal() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive View"),
        actions: [
          FlatButton(
              onPressed: () async {
                // var box = await Hive.openBox('usermodel_db');
                // box.put("key", hiveusermodel.toJson());
                // print("data saved");
              },
              child: Icon(Icons.settings_input_antenna)),
          FlatButton(
              onPressed: () async {
                // var box = Hive.box('usermodel_db');
                // List<HiveUserModel> list = box.get("key");
                // print(list);
                // print("data getting");
              },
              child: Icon(Icons.home))
        ],
      ),
      body: FutureBuilder<List<HiveUserModel>>(
          future: HiveDatabaseHelper.hiveDatabaseHelper.readData(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              print(snapshot.data);
              return Container();
            }
          }),
    );
  }
}
