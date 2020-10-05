import 'package:flutter/material.dart';
import 'package:sqflite_test/localizations/appLocalize_view.dart';
import 'package:sqflite_test/localizations/application_view.dart';

class LocalizationView extends StatefulWidget {
  @override
  _LocalizationViewState createState() => _LocalizationViewState();
}

class _LocalizationViewState extends State<LocalizationView> {
  static final List<String> languageList = application.supportedLanguages;
  static final List<String> languageCodeList =
      application.supportedLanguagesCode;

  final Map languageMap = {
    languageList[0]: languageCodeList[0],
    languageList[1]: languageCodeList[1],
    languageList[2]: languageCodeList[2]
  };

  String label = languageList[0];

  @override
  void initState() {
    super.initState();

    application.onLocalChanged = onLocalChange;
    onLocalChange(Locale(languageMap["Hindi"]));
  }

  void onLocalChange(Locale locale) async {
    setState(() {
      AppTranslations.load(locale);
    });
  }

  void onSelect(String language) {
    print("dd" + language);
    onLocalChange(Locale(languageMap[language]));
    setState(() {
      if (language == "Hindi") {
        label = "हिन्दी";
      } else if (language == "Portugese") {
        label = "Portugese";
      } else {
        label = language;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Localization"),
        actions: [
          PopupMenuButton<String>(
              onSelected: onSelect,
              icon: Icon(Icons.language, color: Colors.white),
              itemBuilder: (BuildContext context) {
                return languageList.map<PopupMenuItem<String>>((e) {
                  return PopupMenuItem<String>(value: e, child: Text(e));
                }).toList();
              })
        ],
      ),
      body: Container(
          alignment: Alignment.center,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_home"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_first_name"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_enter_first_name"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_last_name"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_enter_last_name"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_email"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context)
                      .textKey("key_please_enter_valid_mail"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_password"),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  AppTranslations.of(context).textKey("key_next"),
                  style: TextStyle(fontSize: 18),
                ),
              ])),
    );
  }
}
