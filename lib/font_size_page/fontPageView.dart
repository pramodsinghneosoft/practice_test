import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/font_size_page/font_size_model.dart';
import 'package:sqflite_test/font_size_page/shared_preference_view.dart';

class FontViewPage extends StatefulWidget {
  @override
  _FontViewPageState createState() => _FontViewPageState();
}

class _FontViewPageState extends State<FontViewPage> {
  double fontSize;

  @override
  void initState() {
    super.initState();
    getPrefeValue();
  }

  getPrefeValue() async {
    SharedPreferenceView.getIntValue("key").then((value) {
      if (value != null) {
        if (!mounted) return;
        setState(() {
          fontSize = value.toDouble();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FontPage")),
      body: Container(
          child: Center(
        child: Text(
          "Data value ",
          style: TextStyle(fontSize: fontSize),
        ),
      )),
    );
  }
}
