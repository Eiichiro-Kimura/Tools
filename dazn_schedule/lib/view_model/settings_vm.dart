import 'package:dazn_schedule/model/entity/setting.dart';
import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';
import 'package:flutter/material.dart';

class SettingsVM extends ChangeNotifier {

  SettingsVM(this._preferencesRepository);

  final IPreferencesRepository _preferencesRepository;
  final _settings = <SettingsKind, Setting>{};

  bool get isValid => _preferencesRepository.isValid;

  Setting getSetting(SettingsKind settingsKind) {
    final _setting = _settings[settingsKind];

    return _setting
      ..value = _preferencesRepository.fetchStringValue(_setting.key) ??
          _setting.defaultValue as String;
  }

  void setSetting(Setting setting) {
    _preferencesRepository.storeStringValue(setting.key, setting.value);

    notifyListeners();
  }

  Future<void> init() async {
    await _preferencesRepository.init();

    _settings[SettingsKind.googleApiClientId] = Setting(
      SettingsKind.googleApiClientId,
      'GoogleApiクライアントID',
      'GoogleApiClientId',
      ''
    );
    _settings[SettingsKind.filterGenre] = Setting(
      SettingsKind.filterGenre,
      'ジャンル',
      'FilterGenre',
      ''
    );
    _settings[SettingsKind.filterTournamentName] = Setting(
      SettingsKind.filterTournamentName,
      'リーグ',
      'FilterTournamentName',
      ''
    );

    notifyListeners();
  }
}

enum SettingsKind {
  googleApiClientId,
  filterGenre,
  filterTournamentName,
}
