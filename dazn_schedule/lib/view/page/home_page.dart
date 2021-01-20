import 'package:dazn_schedule/view/app_bar/normal_app_bar.dart';
import 'package:dazn_schedule/view/app_bar/simple_app_bar.dart';
import 'package:dazn_schedule/view/component/programs_component.dart';
import 'package:dazn_schedule/view/component/search_component.dart';
import 'package:dazn_schedule/view/drawer/home_drawer.dart';
import 'package:dazn_schedule/view/floating_action_button/home_floating_action_button.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_view_model.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view_model/standings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final settingsViewModel = context.read<SettingsViewModel>();

    settingsViewModel
        .init()
        .then(
            (_) => _init(
              settingsViewModel.getSetting(SettingsKind.googleApiClientId).value
            )
        );
  }

  @override
  Widget build(BuildContext context) =>
      context.watch<SettingsViewModel>().isValid ?
        _buildNormal(context) : _buildLoading(context);

  Widget _buildLoading(BuildContext context) =>
      Scaffold(
        appBar: SimpleAppBar(widget.title),
      );

  Widget _buildNormal(BuildContext context) =>
      Scaffold(
        appBar: NormalAppBar(widget.title),
        drawer: HomeDrawer(context),
        body: Column(
          children: [
            SearchComponent(context, _searchController, _updateScreen),
            Expanded(
              child: ProgramsComponent(context, _searchController.text),
            ),
          ],
        ),
        floatingActionButton: HomeFloatingActionButton(
            context,
            _initProgramsAndStandings
        ),
      );

  void _init(String apiClientId) {
    context.read<CloudCalendarViewModel>().init(apiClientId);

    _initProgramsAndStandings();
  }

  void _initProgramsAndStandings() {
    final daznTournamentName = context
        .read<SettingsViewModel>()
        .getSetting(SettingsKind.daznTournamentName)
        .value;

    context.read<ProgramsViewModel>().generate();
    context.read<StandingsViewModel>().generate(daznTournamentName);
  }

  void _updateScreen() =>
      setState(() {});
}
