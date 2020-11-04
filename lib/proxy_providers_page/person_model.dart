import 'package:flutter/material.dart';

class Api {
  String get loggedIn => 'I am logged in';
}

// home_model.dart
class HomeModel extends ChangeNotifier {
  final Api api;
  HomeModel({this.api});
}
