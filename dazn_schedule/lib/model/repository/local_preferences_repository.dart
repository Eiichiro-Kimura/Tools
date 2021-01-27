import 'package:dazn_schedule/model/io/preferences.dart';
import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';

class LocalPreferencesRepository implements IPreferencesRepository {

  final _preferences = Preferences();

  @override
  bool get isValid => _preferences.isValid;

  @override
  Future<void> init() async =>
      _preferences.init();

  @override
  String fetchStringValue(String key) =>
      _preferences.getString(key);

  @override
  Future<bool> storeStringValue(String key, String value) =>
      _preferences.setString(key, value);
}
