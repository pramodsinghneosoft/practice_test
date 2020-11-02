import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sqflite_test/email_validator_page/expansion_widget/expansion_view.dart';

class LayoutBuildView extends StatefulWidget {
  @override
  _LayoutBuildViewState createState() => _LayoutBuildViewState();
}

class _LayoutBuildViewState extends State<LayoutBuildView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LayoutBuilder View"),
        actions: [
          FlatButton(
            child: Text("Next screen"),
            onPressed: () {
              Get.to(ExpansionWidgetView());
            },
          )
        ],
      ),
      body: Container(
        height: 300,
        width: 300,
        child: LayoutBuilder(builder: (context, constrains) {
          if (constrains.maxHeight > 200 && constrains.maxWidth > 200) {
            return Row(
              children: [Text("First Text"), Text("Second text")],
            );
          } else {
            return Column(
              children: [
                Text("Third text"),
                Text("Fourth text"),
              ],
            );
          }
        }),
      ),
    );
  }
}
