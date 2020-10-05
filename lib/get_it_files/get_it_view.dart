import 'package:flutter/material.dart';
import 'package:sqflite_test/get_it_files/my_widget.dart';
import 'package:sqflite_test/get_it_files/service_locator_view.dart';
import 'package:sqflite_test/navigator_service/navigator_service.dart';

class GetItView extends StatefulWidget {
  @override
  _GetItViewState createState() => _GetItViewState();
}

class _GetItViewState extends State<GetItView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetIt View")),
      body: Container(
          child: Column(
        children: [
          InkWell(
              onTap: () {
                locator<NavigatorService>().navigateTo("myhomepage");
              },
              child: Text("Hello")),
          Text("Hello"),
          MyWidget(),
        ],
      )),
    );
  }
}
