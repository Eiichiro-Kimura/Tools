import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';

class Setting {

  Setting(this._preferencesRepository, this.settingsKind, this.name,
      this.key, this._defaultValue);

  final IPreferencesRepository _preferencesRepository;
  final SettingsKind settingsKind;
  final String name;
  final String key;
  final dynamic _defaultValue;

  String get value =>
      _preferencesRepository.fetchStringValue(key) ?? _defaultValue as String;
}
