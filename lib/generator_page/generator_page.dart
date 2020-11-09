import 'package:flutter/material.dart';

class GeneratorPage extends StatefulWidget {
  @override
  _GeneratorPageState createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() {
    getAsyncData(10).listen((event) {
      print(event);
    });

    getSyncData(10).forEach((element) {
      print(element);
    });
  }

  Stream<int> getAsyncData(int number) async* {
    int geek = 0;
    while (geek < number) {
      yield geek++;
    }
  }

  Iterable<int> getSyncData(number) sync* {
    int geek = 0;
    while (geek < 10) {
      yield geek++;
      print(geek);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Generator View")),
      body: Container(),
    );
  }
}
