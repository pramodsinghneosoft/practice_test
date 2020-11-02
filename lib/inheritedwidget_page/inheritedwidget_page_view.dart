import 'package:flutter/material.dart';
import 'package:sqflite_test/inheritedwidget_page/form_screen.dart';
import 'package:sqflite_test/inheritedwidget_page/state_container_view.dart';
import 'package:sqflite_test/inheritedwidget_page/user_model_inherited.dart';

class InheritedWidgetPageView extends StatefulWidget {
  @override
  _InheritedWidgetPageViewState createState() =>
      _InheritedWidgetPageViewState();
}

class _InheritedWidgetPageViewState extends State<InheritedWidgetPageView> {
  User user;

  openForm(BuildContext context) {
    // Open Form
    Navigator.push(
      context,
      new MaterialPageRoute(
          fullscreenDialog: true,
          builder: (context) {
            return new FormScreen();
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final containerState = StateContainerView.of(context);
    user = containerState.user;
    return Scaffold(
        appBar: AppBar(
          title: Text("InheritedWidget View"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              user != null ? Text('Name:${user.name}') : Text("No Name"),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                child: Text("Add Name"),
                onPressed: () {
                  openForm(context);
                },
              )
            ],
          ),
        ));
  }
}
