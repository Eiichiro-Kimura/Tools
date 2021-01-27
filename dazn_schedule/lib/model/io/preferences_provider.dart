import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {

  SharedPreferences _sharedPreferences;

  bool get isValid => null != _sharedPreferences;

  Future<void> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  String getString(String key) =>
      _sharedPreferences.getString(key);

  Future<bool> setString(String key, String value) =>
      _sharedPreferences.setString(key, value);
}
