import 'package:flutter/material.dart';
import 'package:sqflite_test/inheritedwidget_page/inherited_state_view.dart';
import 'package:sqflite_test/inheritedwidget_page/user_model_inherited.dart';

class StateContainerView extends StatefulWidget {
  final Widget child;
  final User user;

  const StateContainerView({Key key, this.user, this.child}) : super(key: key);

  static StateContainerViewState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType()
            as InheritedStateContainer)
        .data;
  }

  @override
  StateContainerViewState createState() => StateContainerViewState();
}

class StateContainerViewState extends State<StateContainerView> {
  User user;

  void updateUser({name}) {
    if (user == null) {
      user = new User(name: name);
      setState(() {
        user = user;
      });
    } else {
      setState(() {
        user.name = name ?? user.name;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InheritedStateContainer(data: this, child: widget.child);
  }
}
