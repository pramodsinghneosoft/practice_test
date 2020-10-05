import 'package:flutter/material.dart';
import 'package:sqflite_test/localizations/appLocalize_view.dart';

class AppTranslationDelegate extends LocalizationsDelegate<AppTranslations> {
  final Locale newLocale;

  AppTranslationDelegate({this.newLocale});

  @override
  bool isSupported(Locale locale) =>
      ['en', 'hi', 'pt'].contains(locale.languageCode);

  @override
  Future<AppTranslations> load(Locale locale) {
    return AppTranslations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppTranslations> old) {
    return true;
  }
}
