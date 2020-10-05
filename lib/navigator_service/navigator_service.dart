import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  // ignore: missing_return
  Future<dynamic> navigateTo(String name) {
    return navigatorKey.currentState.pushNamed(name);
  }
}
