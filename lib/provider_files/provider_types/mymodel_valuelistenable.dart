import 'package:flutter/material.dart';

class MyModelValueListenable {
  //                                             <--- MyModel
  ValueNotifier<String> someValue =
      ValueNotifier('Hello'); // <--- ValueNotifier
  void doSomething() {
    someValue.value = 'Value updated';
    print(someValue.value);
  }
}
