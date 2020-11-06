import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:http/http.dart';
import 'package:sqflite_test/sqlite_page/database_helper.dart';
import 'package:sqflite_test/sqlite_page/employee_model.dart';
import 'package:http/http.dart' as http;

class EmployeeApiProvider {
  // ignore: missing_return
  Future<List<EmployeeModel>> getAllEmployees() async {
    var url = "https://demo8161595.mockable.io/employee";
    // Response response = await Dio().get(url);
    // if (response.statusCode == 200) {
    //   var parsed = (response.data as List);
    //   List<EmployeeModel> list = parsed
    //       .map((e) => DBProvider.db.createEmplyee(EmployeeModel.fromJson(e)))
    //       .toList();
    //   return list;
    // }
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body) as List;
      List<EmployeeModel> list = [];
      // List<EmployeeModel> list = parsed
      //     .map((e) => DBProvider.db.createEmplyee(EmployeeModel.fromJson(e)))
      //     .toList();
      for (int i = 0; i < parsed.length; i++) {
        list.add(EmployeeModel.fromJson(parsed[i]));
        DBProvider.db.createEmplyee(EmployeeModel.fromJson(parsed[i]));
        print("data saved");
      }
      print(list);
      return list;
    }
  }
}
