import 'package:flutter/material.dart';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  final List<String> supportedLanguages = ["english", "Hindi", "Portugese"];

  final List<String> supportedLanguagesCode = ["en", "hi", "pt"];

  Iterable<Locale> supportedLocals() =>
      supportedLanguagesCode.map<Locale>((language) => Locale(language, ""));

  LocalChangeCallback onLocalChanged;
}

Application application = Application();
typedef void LocalChangeCallback(Locale locale);
