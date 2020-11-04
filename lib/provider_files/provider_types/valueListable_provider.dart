import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/provider_files/provider_types/mymodel_valuelistenable.dart';
import 'package:sqflite_test/provider_files/provider_types/proxy_providers_page_view.dart';

class ValueListenableProviderPage extends StatefulWidget {
  @override
  _ValueListenableProviderPageState createState() =>
      _ValueListenableProviderPageState();
}

class _ValueListenableProviderPageState
    extends State<ValueListenableProviderPage> {
  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(title: Text("ValueListenable Provider")),
      body: Container(
          child: Provider<MyModelValueListenable>(
        create: (context) => MyModelValueListenable(),
        child: Consumer<MyModelValueListenable>(
          builder: (context, value, child) {
            print("data called");
            return ValueListenableProvider<String>.value(
              value: value.someValue,
              child: Column(children: [
                Container(child: Consumer<String>(
                  builder: (context, value, child) {
                    return Text(value);
                  },
                )),
                Container(child: Consumer<MyModelValueListenable>(
                  builder: (context, value, child) {
                    return FlatButton(
                      color: Colors.grey,
                      onPressed: () {
                        value.doSomething();
                      },
                      child: Text("Do Something"),
                    );
                  },
                )),
                FlatButton(
                    onPressed: () {
                      Get.to(ProxyProvidersPageView());
                    },
                    child: Text("Next page"))
              ]),
            );
          },
        ),
      )),
    );
  }
}
