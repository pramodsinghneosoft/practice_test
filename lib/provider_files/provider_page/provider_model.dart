import 'package:flutter/material.dart';

class ProviderModel extends ChangeNotifier {
  bool _isValid = false;

  bool get boolValue => _isValid;

  void updateValue(bool value) {
    _isValid = value;
    notifyListeners();
  }
}
