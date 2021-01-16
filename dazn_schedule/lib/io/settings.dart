import 'package:shared_preferences/shared_preferences.dart';

enum SettingsKind {

  googleApiClientId,
  daznGenre,
  daznTournamentName,
}

class Settings {

  final _infoMap = <SettingsKind, SettingsInfo>{};

  SharedPreferences _sharedPreferences;

  SettingsInfo get(SettingsKind settingsKind) {
    return _infoMap[settingsKind];
  }

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _infoMap[SettingsKind.googleApiClientId] = SettingsInfo(
        _sharedPreferences,
        'GoogleApiClientId',
        '',
        'GoogleApiクライアントID'
    );
    _infoMap[SettingsKind.daznGenre] = SettingsInfo(
        _sharedPreferences,
        'DaznGenre',
        '',
        'ジャンル'
    );
    _infoMap[SettingsKind.daznTournamentName] = SettingsInfo(
        _sharedPreferences,
        'DaznTournamentName',
        '',
        'リーグ'
    );
  }

  bool get isValid => null != _sharedPreferences;
}

class SettingsInfo {

  SettingsInfo(
      this._sharedPreferences,
      this._key,
      this._defaultValue,
      this.name
  );

  final SharedPreferences _sharedPreferences;
  final String _key;
  final dynamic _defaultValue;
  final String name;

  String get value =>
      _sharedPreferences.getString(_key) ?? _defaultValue as String;

  void updateValue(String value) =>
      _sharedPreferences.setString(_key, value);
}
