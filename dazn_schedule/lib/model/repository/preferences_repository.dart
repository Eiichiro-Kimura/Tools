import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesRepository implements IPreferencesRepository {

  SharedPreferences _sharedPreferences;

  @override
  bool get isValid => null != _sharedPreferences;

  @override
  Future<void> init() async =>
      _sharedPreferences = await SharedPreferences.getInstance();

  @override
  String getString(String key) =>
      _sharedPreferences.getString(key);

  @override
  Future<bool> setString(String key, String value) =>
      _sharedPreferences.setString(key, value);
}
