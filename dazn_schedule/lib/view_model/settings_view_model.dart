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

  Setting get(SettingsKind settingsKind) =>
      _infoMap[settingsKind];

  Future<void> init() async {
    await preferencesRepository.init();

    _infoMap[SettingsKind.googleApiClientId] = Setting(
        preferencesRepository,
        'GoogleApiClientId',
        '',
        'GoogleApiクライアントID'
    );
    _infoMap[SettingsKind.daznGenre] = Setting(
        preferencesRepository,
        'DaznGenre',
        '',
        'ジャンル'
    );
    _infoMap[SettingsKind.daznTournamentName] = Setting(
        preferencesRepository,
        'DaznTournamentName',
        '',
        'リーグ'
    );

    // リスナーに通達
    notifyListeners();
  }

  bool get isValid => preferencesRepository.isValid;
}
