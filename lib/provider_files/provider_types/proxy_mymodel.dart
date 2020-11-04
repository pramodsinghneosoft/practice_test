import 'package:flutter/material.dart';

class ProxyMyModel extends ChangeNotifier {
  String someValue = "initial value";

  void doSomething(String value) {
    someValue = value;
    print(value);
    notifyListeners();
  }
}
