import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:provider/provider.dart';
import 'package:sqflite_test/provider_files/provider_types/mymodel.dart';
import 'package:sqflite_test/provider_files/provider_types/valueListable_provider.dart';

class StreamProviderPage extends StatefulWidget {
  @override
  _StreamProviderPageState createState() => _StreamProviderPageState();
}

class _StreamProviderPageState extends State<StreamProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StreamProvider Page")),
      body: Container(
          width: double.infinity,
          child: StreamProvider<MyModel>(
            create: (context) => getStreamValue(),
            initialData: MyModel(someValue: "Dafault Value"),
            child: Column(children: [
              Container(child: Consumer<MyModel>(
                builder: (context, value, child) {
                  return Text(value.someValue);
                },
              )),
              Container(child: Consumer<MyModel>(
                builder: (context, value, child) {
                  return FlatButton(
                      color: Colors.grey,
                      onPressed: () {
                        value.doSomething();
                      },
                      child: Text("Do something"));
                },
              )),
              FlatButton(
                  color: Colors.grey,
                  onPressed: () {
                    Get.to(ValueListenableProviderPage());
                  },
                  child: Text("Next page"))
            ]),
          )),
    );
  }

  Stream<MyModel> getStreamValue() {
    return Stream<MyModel>.periodic(
        Duration(seconds: 1), (x) => MyModel(someValue: "$x")).take(10);
  }
}
