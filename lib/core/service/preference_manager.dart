import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static late SharedPreferences _sharedPreferences;

  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static setBool({required String key, required bool value}) {
    _sharedPreferences.setBool(key, value);
  }

  static getBool({required String key}) {
    return _sharedPreferences.getBool(key) ?? false;
  }
}
