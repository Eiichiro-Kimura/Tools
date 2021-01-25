import 'package:dazn_schedule/view/app_bar/normal_app_bar.dart';
import 'package:dazn_schedule/view/app_bar/simple_app_bar.dart';
import 'package:dazn_schedule/view/drawer/home_drawer.dart';
import 'package:dazn_schedule/view/floating_action_button/home_floating_action_button.dart';
import 'package:dazn_schedule/view/part/programs_part.dart';
import 'package:dazn_schedule/view/part/search_part.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_vm.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:dazn_schedule/view_model/standings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    final settingsVM = context.read<SettingsVM>();

    settingsVM
        .init()
        .then((_) {
          final googleApiClientId = settingsVM
              .getSetting(SettingsKind.googleApiClientId)
              .value;
          _init(googleApiClientId);
        });
  }

  @override
  Widget build(BuildContext context) =>
      context.watch<SettingsVM>().isValid ?
        _buildNormal(context) : _buildLoading(context);

  Widget _buildLoading(BuildContext context) =>
      Scaffold(
        appBar: SimpleAppBar(widget.title),
      );

  Widget _buildNormal(BuildContext context) =>
      Scaffold(
        appBar: NormalAppBar(context, widget.title),
        drawer: HomeDrawer(context),
        body: Column(
          children: [
            SearchComponent(context),
            Expanded(
              child: ProgramsPart(context),
            ),
          ],
        ),
        floatingActionButton: HomeFloatingActionButton(
          context,
          _initProgramsAndStandings,
        ),
      );

  void _init(String apiClientId) {
    context.read<CloudCalendarVM>().init(apiClientId);
    context.read<FavoriteTeamsVM>().init();

    _initProgramsAndStandings();
  }

  void _initProgramsAndStandings() {
    final settingsVM = context.read<SettingsVM>();
    final programsVM = context.read<ProgramsVM>();
    final standingsVM = context.read<StandingsVM>();

    final daznTournamentName = settingsVM
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    programsVM.generate();
    standingsVM.generate(daznTournamentName);
  }
}
