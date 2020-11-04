import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/provider_files/provider_types/proxy_anothermodel.dart';
import 'package:sqflite_test/provider_files/provider_types/proxy_mymodel.dart';

class ProxyProvidersPageView extends StatefulWidget {
  @override
  _ProxyProvidersPageViewState createState() => _ProxyProvidersPageViewState();
}

class _ProxyProvidersPageViewState extends State<ProxyProvidersPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ProxyProviders Page")),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<ProxyMyModel>(
            create: (context) => ProxyMyModel(),
          ),
          ProxyProvider<ProxyMyModel, ProxyAnotherModel>(
              update: (context, proxymodel, proxyanothermodel) =>
                  ProxyAnotherModel(proxyMyModel: proxymodel)),
        ],
        child: Column(children: [
          Container(child: Consumer<ProxyMyModel>(
            builder: (context, value, child) {
              return FlatButton(
                onPressed: () {
                  value.doSomething("proxy model");
                },
                child: Text("do somenthing"),
              );
            },
          )),
          Container(child: Consumer<ProxyMyModel>(
            builder: (context, value, child) {
              return Text(value.someValue);
            },
          )),
          Container(child: Consumer<ProxyAnotherModel>(
            builder: (context, value, child) {
              return FlatButton(
                  onPressed: () {
                    value.doSomething1();
                  },
                  child: Text("do something"));
            },
          ))
        ]),
      ),
    );
  }
}
