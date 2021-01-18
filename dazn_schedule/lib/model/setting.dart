import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';

class Setting {

  Setting(this._preferencesRepository, this._key, this._defaultValue,
      this.name);

  final IPreferencesRepository _preferencesRepository;
  final String _key;
  final dynamic _defaultValue;
  final String name;

  String get value =>
      _preferencesRepository.getString(_key) ?? _defaultValue as String;

  void updateValue(String value) =>
      _preferencesRepository.setString(_key, value);
}
