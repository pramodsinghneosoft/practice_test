import 'package:flutter/material.dart';

class ProviderCounterModel extends ChangeNotifier {
  int _counter = 60;
  int getCounter() => _counter;

  updateCounter() {
    _counter--;
    notifyListeners();
  }
}
