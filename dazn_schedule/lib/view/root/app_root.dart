import 'package:dazn_schedule/model/repository/dazn_programs_repository.dart';
import 'package:dazn_schedule/model/repository/football_competition_repository.dart';
import 'package:dazn_schedule/model/repository/google_calendar_repository.dart';
import 'package:dazn_schedule/model/repository/local_favorite_teams_repository.dart';
import 'package:dazn_schedule/model/repository/local_preferences_repository.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_vm.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/programs_filter_vm.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:dazn_schedule/view_model/standings_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatefulWidget {

  const AppRoot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>
            CtrlHomeVM(this)
        ),
        ChangeNotifierProvider(create: (_) =>
            CtrlSettingsVM(this)
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
