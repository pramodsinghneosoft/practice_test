import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/dark_theme_page/dark_theme_model.dart';

class DarkThemeView extends StatefulWidget {
  @override
  _DarkThemeViewState createState() => _DarkThemeViewState();
}

class _DarkThemeViewState extends State<DarkThemeView> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Dark View")),
      body: Container(
        height: 100,
        alignment: Alignment.center,
        child: Checkbox(
            value: themeChange.darkTheme,
            onChanged: (bool value) {
              themeChange.darkTheme = value;
            }),
      ),
    );
  }
}
