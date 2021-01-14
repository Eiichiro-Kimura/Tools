import 'package:shared_preferences/shared_preferences.dart';

enum SettingsKind {

  googleApiClientId,
}

class Settings {

  final _infoMap = {
    SettingsKind.googleApiClientId: _SettingsInfo(
        'GoogleApiClientId',
        '',
        'GoogleApiクライアントID'
    )
  };

  SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  bool get isValid => null != _sharedPreferences;

  String getStringValue(SettingsKind settingsKind) =>
      _sharedPreferences.getString(_infoMap[settingsKind].key) ??
      _infoMap[settingsKind].defaultValue as String;

  String getName(SettingsKind settingsKind) =>
      _infoMap[settingsKind].name;

  void setStringValue(SettingsKind settingsKind, String value) =>
      _sharedPreferences.setString(_infoMap[settingsKind].key, value);
}

class _SettingsInfo {

  _SettingsInfo(this.key, this.defaultValue, this.name);

  final String key;
  final dynamic defaultValue;
  final String name;
}
