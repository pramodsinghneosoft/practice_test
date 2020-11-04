import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/provider_files/provider_types/mymodel.dart';
import 'package:sqflite_test/provider_files/provider_types/stream_provider_page.dart';

class ProviderPageTypes extends StatefulWidget {
  @override
  _ProviderPageTypesState createState() => _ProviderPageTypesState();
}

class _ProviderPageTypesState extends State<ProviderPageTypes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Provider Types")),
      body: Container(
        width: double.infinity,
        child: FutureProvider(
          initialData: MyModel(someValue: "Default value"),
          create: (context) => someFutureValue(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Consumer<MyModel>(
                  builder: (context, value, child) {
                    return Text(value.someValue);
                  },
                ),
              ),
              //Note that pressing the “Do something” button does not update the UI, even after the Future completes.
              // If you want that kind of functionality, then just use the ChangeNotifierProvider .
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
              Container(
                  child: FlatButton(
                      onPressed: () {
                        Get.to(StreamProviderPage());
                      },
                      child: Text("Next Page")))
            ],
          ),
        ),
      ),
    );
  }

  Future<MyModel> someFutureValue() async {
    await Future.delayed(
      Duration(seconds: 2),
    );
    return MyModel(someValue: "new Data");
  }
}
