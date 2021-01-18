import 'package:dazn_schedule/view_model/competition_standings_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/model/repository/preferences_repository.dart';
import 'package:dazn_schedule/view/helper/page_manager.dart';
import 'package:dazn_schedule/view_model/program_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => SettingsViewModel(PreferencesRepository())
        ),
        ChangeNotifierProvider(
            create: (_) => ProgramViewModel()
        ),
        ChangeNotifierProvider(
            create: (_) => CompetitionStandingsViewModel()
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
