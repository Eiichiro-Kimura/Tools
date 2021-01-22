import 'package:dazn_schedule/model/repository/dazn_programs_repository.dart';
import 'package:dazn_schedule/model/repository/football_competition_repository.dart';
import 'package:dazn_schedule/model/repository/google_calendar_repository.dart';
import 'package:dazn_schedule/model/repository/preferences_repository.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_view_model.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view_model/standings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SettingsViewModel(PreferencesRepository())
        ),
        ChangeNotifierProvider(
            create: (_) => ProgramsViewModel(DaznProgramsRepository())
        ),
        ChangeNotifierProvider(
            create: (_) => StandingsViewModel(FootballCompetitionRepository())
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
        initialRoute: PageManager().initialRoute,
        routes: PageManager().routes,
      ),
    );
  }
}