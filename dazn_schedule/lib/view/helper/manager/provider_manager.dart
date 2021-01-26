import 'package:dazn_schedule/model/repository/dazn_programs_repository.dart';
import 'package:dazn_schedule/model/repository/football_competition_repository.dart';
import 'package:dazn_schedule/model/repository/google_calendar_repository.dart';
import 'package:dazn_schedule/model/repository/local_favorite_teams_repository.dart';
import 'package:dazn_schedule/model/repository/local_preferences_repository.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_vm.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/programs_filter_vm.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:dazn_schedule/view_model/standings_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderManager {

  ProviderManager(TickerProvider tickerProvider) : providers = [
    ChangeNotifierProvider(create: (_) =>
        CtrlHomeVM(tickerProvider)
    ),
    ChangeNotifierProvider(create: (_) =>
        CtrlSettingsVM(tickerProvider)
    ),
    ChangeNotifierProvider(create: (_) =>
        SettingsVM(LocalPreferencesRepository())
    ),
    ChangeNotifierProvider(create: (_) =>
        ProgramsVM(DaznProgramsRepository())
    ),
    ChangeNotifierProvider(create: (_) =>
        StandingsVM(FootballCompetitionRepository())
    ),
    ChangeNotifierProvider(create: (_) =>
        ProgramsFilterVM()
    ),
    ChangeNotifierProvider(create: (_) =>
        FavoriteTeamsVM(LocalFavoriteTeamsRepository())
    ),
    Provider<CloudCalendarVM>.value(
        value: CloudCalendarVM(GoogleCalendarRepository())
    ),
  ];

  final List<SingleChildWidget> providers;
}
