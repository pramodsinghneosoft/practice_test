import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/proxy_providers_page/person_model.dart';

class ProxyProviderPage extends StatefulWidget {
  @override
  _ProxyProviderPageState createState() => _ProxyProviderPageState();
}

class _ProxyProviderPageState extends State<ProxyProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProxyProvider")),
      body: Container(child: Consumer<HomeModel>(
        builder: (context, value, child) {
          return Text("hi ${value.api.loggedIn}");
        },
      )),
    );
  }
}
