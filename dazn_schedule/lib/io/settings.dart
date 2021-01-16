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
      this.key,
      this.defaultValue,
      this.name
  );

  final SharedPreferences _sharedPreferences;
  final String key;
  final dynamic defaultValue;
  final String name;

  String get value =>
      _sharedPreferences.getString(key) ?? defaultValue as String;

  void updateValue(String value) =>
      _sharedPreferences.setString(key, value);
}
