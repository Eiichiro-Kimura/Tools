import 'package:dazn_schedule/view/app_bar/normal_app_bar.dart';
import 'package:dazn_schedule/view/app_bar/simple_app_bar.dart';
import 'package:dazn_schedule/view/drawer/home_drawer.dart';
import 'package:dazn_schedule/view/floating_action_button/home_floating_action_button.dart';
import 'package:dazn_schedule/view/helper/controller/home_controller.dart';
import 'package:dazn_schedule/view/part/programs_part.dart';
import 'package:dazn_schedule/view/part/search_part.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_view_model.dart';
import 'package:dazn_schedule/view_model/favorite_team_view_model.dart';
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  _HomePageState() {
    _homeController = HomeController(this, _updateScreen);
  }

  HomeController _homeController;

  @override
  void initState() {
    super.initState();

    final settingsViewModel = context.read<SettingsViewModel>();

    settingsViewModel
        .init()
        .then((_) {
          final googleApiClientId = settingsViewModel
              .getSetting(SettingsKind.googleApiClientId)
              .value;
          _init(googleApiClientId);
        });
  }

  @override
  void dispose() {
    _homeController.dispose();

    super.dispose();
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
        appBar: NormalAppBar(
          widget.title,
          _homeController.searchText,
          _homeController.favoriteAnimation,
          _homeController.menuAnimation,
          _homeController.trashAnimation
        ),
        drawer: HomeDrawer(context),
        body: Column(
          children: [
            SearchComponent(
                context,
                _homeController.searchText,
                _homeController.clearAnimation,
                _homeController.calendarAnimation
            ),
            Expanded(
              child: ProgramsPart(context, _homeController.searchText.text),
            ),
          ],
        ),
        floatingActionButton: HomeFloatingActionButton(
          context,
          _homeController.settingsAnimation,
          _initProgramsAndStandings,
        ),
      );

  void _init(String apiClientId) {
    context.read<CloudCalendarViewModel>().init(apiClientId);
    context.read<FavoriteTeamViewModel>().init();

    _initProgramsAndStandings();
  }

  void _initProgramsAndStandings() {
    final daznTournamentName = context
        .read<SettingsViewModel>()
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    context.read<ProgramsViewModel>().generate();
    context.read<StandingsViewModel>().generate(daznTournamentName);
  }

  void _updateScreen() => setState(() {});
}
