import 'package:sqflite_test/provider_files/provider_types/proxy_mymodel.dart';

class ProxyAnotherModel {
  ProxyMyModel proxyMyModel;
  ProxyAnotherModel({this.proxyMyModel});

  void doSomething1() {
    proxyMyModel.doSomething("new value");
    print("doSomething1");
  }
}
