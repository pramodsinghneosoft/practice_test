import 'package:flutter/material.dart';
import 'package:sqflite_test/inheritedwidget_page/state_container_view.dart';

class InheritedStateContainer extends InheritedWidget {
  final StateContainerViewState data;

  InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
