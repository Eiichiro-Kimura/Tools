import 'package:dazn_schedule/model/repository/dazn_programs_repository.dart';
import 'package:dazn_schedule/model/repository/football_competition_repository.dart';
import 'package:dazn_schedule/model/repository/google_calendar_repository.dart';
import 'package:dazn_schedule/model/repository/local_favorite_teams_repository.dart';
import 'package:dazn_schedule/model/repository/local_preferences_repository.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_view_model.dart';
import 'package:dazn_schedule/view_model/programs_filter_view_model.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:dazn_schedule/view_model/favorite_teams_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view_model/standings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>
            SettingsViewModel(LocalPreferencesRepository())
        ),
        ChangeNotifierProvider(create: (_) =>
            ProgramsViewModel(DaznProgramsRepository())
        ),
        ChangeNotifierProvider(create: (_) =>
            StandingsViewModel(FootballCompetitionRepository())
        ),
        ChangeNotifierProvider(create: (_) =>
            ProgramsFilterViewModel()
        ),
        ChangeNotifierProvider(create: (_) =>
            FavoriteTeamsViewModel(LocalFavoriteTeamsRepository())
        ),
        Provider<CloudCalendarViewModel>.value(
            value: CloudCalendarViewModel(GoogleCalendarRepository())
        ),
      ],
      child: MaterialApp(
        title: 'Dazn Schedule',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ja'),
        ],
        initialRoute: PageManager().initialRoute,
        routes: PageManager().routes,
      ),
    );
  }
}
