import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/provider_files/provider_page/provider_model.dart';

class ProviderPageView extends StatefulWidget {
  @override
  _ProviderPageViewState createState() => _ProviderPageViewState();
}

class _ProviderPageViewState extends State<ProviderPageView> {
  bool isValid = true;
  @override
  Widget build(BuildContext context) {
    var providerValue = Provider.of<ProviderModel>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: Text("Provider Page ")),
      body: Container(
          child: Column(
        children: [
          FlatButton(
            child: Text("UpdateValue"),
            onPressed: () {
              providerValue.updateValue(isValid);
              setState(() {
                isValid = !providerValue.boolValue;
              });
            },
          ),
          providerValue.boolValue
              ? Icon(Icons.circle, color: Colors.green)
              : Icon(Icons.circle, color: Colors.red)
        ],
      )),
    );
  }
}
