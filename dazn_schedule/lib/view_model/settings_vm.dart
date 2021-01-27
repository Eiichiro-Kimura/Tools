import 'package:dazn_schedule/model/entity/setting.dart';
import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';
import 'package:flutter/material.dart';

class SettingsVM extends ChangeNotifier {

  SettingsVM(this._preferencesRepository);

  final IPreferencesRepository _preferencesRepository;
  final _infoMap = <SettingsKind, Setting>{};

  bool get isValid => _preferencesRepository.isValid;

  Setting getSetting(SettingsKind settingsKind) => _infoMap[settingsKind];

  void setValue(SettingsKind settingsKind, String value) {
    _preferencesRepository.storeStringValue(
        getSetting(settingsKind).key,
        value
    );

    notifyListeners();
  }

  Future<void> init() async {
    await _preferencesRepository.init();

    _infoMap[SettingsKind.googleApiClientId] = Setting(
      _preferencesRepository,
      SettingsKind.googleApiClientId,
      'GoogleApiクライアントID',
      'GoogleApiClientId',
      '',
    );
    _infoMap[SettingsKind.filterGenre] = Setting(
      _preferencesRepository,
      SettingsKind.filterGenre,
      'ジャンル',
      'FilterGenre',
      '',
    );
    _infoMap[SettingsKind.filterTournamentName] = Setting(
      _preferencesRepository,
      SettingsKind.filterTournamentName,
      'リーグ',
      'FilterTournamentName',
      '',
    );

    notifyListeners();
  }
}

enum SettingsKind {
  googleApiClientId,
  filterGenre,
  filterTournamentName,
}
