import 'dart:convert';

import 'package:sqflite_test/bloc_pattern/posts_model.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<List<PostsModel>> getPosts() async {
    var client = http.Client();
    List<PostsModel> list = [];
    try {
      var response =
          await client.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString) as List;
        List<PostsModel> list =
            jsonMap.map((e) => PostsModel.fromJson(e)).toList();
        // newsModel = PostsModel.fromJson(jsonMap);
        return list;
      }
    } catch (Exception) {
      return list;
    }

    return list;
  }
}
