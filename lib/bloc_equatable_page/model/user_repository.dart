import 'dart:convert';

import 'package:sqflite_test/bloc_equatable_page/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite_test/bloc_pattern/posts_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUserData();
  Future<List<PostsModel>> getPostsData();
}

class UserRepositoryImpl implements UserRepository {
  @override
  // ignore: missing_return
  Future<List<UserModel>> getUserData() async {
    var response = await http.get("https://jsonplaceholder.typicode.com/users");
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body) as List;
      List<UserModel> userModel =
          parsed.map((e) => UserModel.fromJson(e)).toList();
      return userModel;
    }
  }

  @override
  // ignore: missing_return
  Future<List<PostsModel>> getPostsData() async {
    // var response = await http.get("https://jsonplaceholder.typicode.com/posts");

    // if (response.statusCode == 200) {
    //   var parsed = jsonDecode(response.body) as List;
    //   List<PostsModel> postsModel =
    //       parsed.map((e) => PostsModel.fromJson(e)).toList();
    //   return postsModel;
    // }
  }
}
