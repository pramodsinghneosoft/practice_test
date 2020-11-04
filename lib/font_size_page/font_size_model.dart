import 'package:flutter/material.dart';

class FontModel extends ChangeNotifier {
  int _fontsize;
  int get fontSize => _fontsize;

  void changeFontSize(int value) {
    _fontsize = value;
    notifyListeners();
  }
}
