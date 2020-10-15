import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite_test/getx_page/model/user_model.dart';

class UserController extends GetxController {
  var userList = List<UserModel>().obs;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // ignore: missing_return
  Future<List<UserModel>> fetchData() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body) as List;
      List<UserModel> userModel =
          parsed.map((e) => UserModel.fromJson(e)).toList();
      userList.value = userModel;
      return userModel;
    }
  }
}
