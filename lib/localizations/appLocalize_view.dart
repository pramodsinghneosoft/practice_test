import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTranslations {
  Locale locale;
  static Map _localizedValues;

  AppTranslations(Locale locale) {
    this.locale = locale;
  }

  static AppTranslations of(BuildContext context) {
    return Localizations.of(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    AppTranslations translations = AppTranslations(locale);
    String jsonContent = await rootBundle
        .loadString("assets/locale/localization_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return translations;
  }

  get currentLanguage => locale.languageCode;

  String textKey(String key) {
    return _localizedValues[key] ?? "$key not found";
  }
}
