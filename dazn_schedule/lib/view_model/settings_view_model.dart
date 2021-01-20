import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';
import 'package:dazn_schedule/model/setting.dart';
import 'package:flutter/material.dart';

enum SettingsKind {

  googleApiClientId,
  daznGenre,
  daznTournamentName,
}

class SettingsViewModel extends ChangeNotifier {

  SettingsViewModel(this.preferencesRepository);

  final IPreferencesRepository preferencesRepository;
  final _infoMap = <SettingsKind, Setting>{};

  bool get isValid => preferencesRepository.isValid;

  Setting getSetting(SettingsKind settingsKind) =>
      _infoMap[settingsKind];

  void setValue(SettingsKind settingsKind, String value) {
    preferencesRepository.setString(getSetting(settingsKind).key, value);

    // リスナーに通達
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
    _infoMap[SettingsKind.daznGenre] = Setting(
      preferencesRepository,
      SettingsKind.daznGenre,
      'ジャンル',
      'DaznGenre',
      '',
    );
    _infoMap[SettingsKind.daznTournamentName] = Setting(
      preferencesRepository,
      SettingsKind.daznTournamentName,
      'リーグ',
      'DaznTournamentName',
      '',
    );

    // リスナーに通達
    notifyListeners();
  }
}
