import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceView {
  static saveInt(String key, int strValue) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(key, strValue);
  }

  static getIntValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(key);
  }
}
