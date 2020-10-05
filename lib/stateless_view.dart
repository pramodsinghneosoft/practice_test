import 'package:flutter/material.dart';

class StateDataView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateless View")),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              DecorationView("Red"),
              SizedBox(height: 10),
              DecorationView("Blue"),
              SizedBox(height: 10),
              DecorationView("Gray"),
            ],
          )),
    );
  }
}

class DecorationView extends StatelessWidget {
  String name = "";
  DecorationView(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
          decoration: BoxDecoration(color: Colors.lightBlue),
          child: Text(
            name,
            style: TextStyle(),
          )),
    );
  }
}
