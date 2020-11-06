import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:sqflite_test/hive_page/hive_database_helper.dart';
import 'package:sqflite_test/hive_page/hive_model.dart';

class HiveApiProvider {
  // ignore: missing_return
  Future<List<HiveUserModel>> getHiveData() async {
    Response response =
        await http.get("https://jsonplaceholder.typicode.com/users");

    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body) as List;
      List<HiveUserModel> list = [];
      // List<HiveUserModel> list = parsed
      //     .map((e) => HiveDatabaseHelper.hiveDatabaseHelper
      //         .insertData(HiveUserModel.fromJson(e)))
      //     .toList();
      // return list;

      for (int i = 0; i < parsed.length; i++) {
        list.add(HiveUserModel.fromJson(parsed[i]));
        HiveDatabaseHelper.hiveDatabaseHelper
            .insertData(HiveUserModel.fromJson(parsed[i]));
      }
      return list;
    }
  }
}
