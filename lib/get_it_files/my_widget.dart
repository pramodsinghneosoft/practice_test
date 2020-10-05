import 'package:flutter/material.dart';
import 'package:sqflite_test/get_it_files/api_service.dart';
import 'package:sqflite_test/get_it_files/network_model.dart';
import 'package:sqflite_test/get_it_files/service_locator_view.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var instance = locator<APIService>();
  var networkInstance = locator<NetworkInfo>();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(instance.service),
        Text(networkInstance.networkInfo),
      ],
    ));
  }
}
