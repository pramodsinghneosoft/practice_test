import 'dart:convert';

import 'package:sqflite_test/listview_filter/listviewmodel.dart';
import 'package:http/http.dart' as http;

class ServiceCall {
  static Future<List<ListViewFilterModel>> getData() async {
    try {
      final response =
          await http.get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return parsedUsers(response.body);
      } else {
        return List<ListViewFilterModel>();
      }
    } catch (e) {
      print("Error ${e.toString()}");
      return List<ListViewFilterModel>();
    }
  }

  static List<ListViewFilterModel> parsedUsers(String responsebody) {
    final parsed = jsonDecode(responsebody) as List;
    List<ListViewFilterModel> parsedlist =
        parsed.map((e) => ListViewFilterModel.fromJson(e)).toList();
    return parsedlist;
  }
}
