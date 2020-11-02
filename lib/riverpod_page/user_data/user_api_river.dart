import 'dart:convert';

import 'package:hooks_riverpod/all.dart';
import 'package:sqflite_test/riverpod_page/user_data/river_user_model.dart';
import 'package:http/http.dart' as http;

class UserFetchData extends StateNotifier<List<RiverUserModel>> {
  UserFetchData(List<RiverUserModel> state) : super(state);

  final _initialValue = RiverUserModel;

  Future<List<RiverUserModel>> getData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body) as List;
      // RiverUserModel model = RiverUserModel.fromJson(parsed);
      List<RiverUserModel> model = parsed.map((e) {
        RiverUserModel.fromJson(e);
      }).toList();

      state = model;
    }
  }
}
