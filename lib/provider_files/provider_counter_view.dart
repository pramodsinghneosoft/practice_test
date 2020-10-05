import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/provider_files/provider_model.dart';

class ProviderView extends StatefulWidget {
  @override
  _ProviderViewState createState() => _ProviderViewState();
}

class _ProviderViewState extends State<ProviderView> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      var provier = Provider.of<ProviderCounterModel>(context, listen: false);
      provier.updateCounter();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("=======started from scratch=======");

    return Scaffold(
      appBar: AppBar(title: Text("Provider Counter")),
      body: Container(
        child: Center(child:
            Consumer<ProviderCounterModel>(builder: (context, data, child) {
          return Text(
            data.getCounter()?.toString() ?? "",
            style: TextStyle(fontSize: 60),
          );
        })),
      ),
    );
  }
}
