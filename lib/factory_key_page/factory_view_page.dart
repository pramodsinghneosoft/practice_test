import 'package:flutter/material.dart';

class FactoryPage extends StatefulWidget {
  @override
  _FactoryPageState createState() => _FactoryPageState();
}

class _FactoryPageState extends State<FactoryPage> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    // ignore: unused_local_variable
    var _single = SingleTon.instance;
    // ignore: unused_local_variable
    var _single1 = SingleTon1();
    // ignore: unused_local_variable
    var _single2 = SingleTon2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Factory View")),
      body: Container(),
    );
  }
}

class SingleTon {
  static SingleTon _instance;

  static get instance {
    if (_instance == null) {
      _instance = SingleTon._constructor();
    }
    return _instance;
  }

  SingleTon._constructor();
}

class SingleTon1 {
  static SingleTon1 _instance1;
  factory SingleTon1() {
    if (_instance1 == null) {
      _instance1 = SingleTon1._constructor1();
    }
    return _instance1;
  }

  SingleTon1._constructor1();
}

class SingleTon2 {
  static SingleTon2 _instance2;
  SingleTon2._internal() {
    _instance2 = this;
  }
  factory SingleTon2() => _instance2 ?? SingleTon2._internal();
}
