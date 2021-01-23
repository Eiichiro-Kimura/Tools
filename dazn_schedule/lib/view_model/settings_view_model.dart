import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';
import 'package:dazn_schedule/model/setting.dart';
import 'package:flutter/material.dart';

enum SettingsKind {
  googleApiClientId,
  filterGenre,
  filterTournamentName,
}

class SettingsViewModel extends ChangeNotifier {

  SettingsViewModel(this.preferencesRepository);

  final IPreferencesRepository preferencesRepository;
  final _infoMap = <SettingsKind, Setting>{};

  bool get isValid => preferencesRepository.isValid;

  Setting getSetting(SettingsKind settingsKind) => _infoMap[settingsKind];

  void setValue(SettingsKind settingsKind, String value) {
    preferencesRepository.setString(getSetting(settingsKind).key, value);
    notifyListeners();
  }

  Future<void> init() async {
    await preferencesRepository.init();

    _infoMap[SettingsKind.googleApiClientId] = Setting(
      preferencesRepository,
      SettingsKind.googleApiClientId,
      'GoogleApiクライアントID',
      'GoogleApiClientId',
      '',
    );
    _infoMap[SettingsKind.filterGenre] = Setting(
      preferencesRepository,
      SettingsKind.filterGenre,
      'ジャンル',
      'FilterGenre',
      '',
    );
    _infoMap[SettingsKind.filterTournamentName] = Setting(
      preferencesRepository,
      SettingsKind.filterTournamentName,
      'リーグ',
      'FilterTournamentName',
      '',
    );

    notifyListeners();
  }
}
