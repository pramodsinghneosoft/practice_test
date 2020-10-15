import 'package:flutter/material.dart';
import 'package:sqflite_test/localizations/appLocalize_view.dart';

class LocalizaPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<LocalizaPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Localization View")),
      body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_home"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_first_name"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_enter_first_name"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_last_name"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_enter_last_name"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_email"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context)
                  .textKey("key_please_enter_valid_mail"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_password"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              AppTranslations.of(context).textKey("key_next"),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ])),
    );
  }
}
