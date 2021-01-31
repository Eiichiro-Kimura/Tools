import 'package:dazn_schedule/view/app_bar/normal_app_bar.dart';
import 'package:dazn_schedule/view/floating_action_button/home_floating_action_button.dart';
import 'package:dazn_schedule/view/helper/manager/tab_manager.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:dazn_schedule/view_model/scorers_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:dazn_schedule/view_model/standings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScaffold extends Scaffold {

  HomeScaffold(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      String title) : super(
    key: scaffoldKey,
    appBar: NormalAppBar(context, scaffoldKey, title),
    body: TabManager().createTabBarView(context),
    floatingActionButton: HomeFloatingActionButton(context, init),
  );

  static void init(BuildContext context) {
    final settingsVM = context.read<SettingsVM>();
    final programsVM = context.read<ProgramsVM>();
    final standingsVM = context.read<StandingsVM>();
    final scorersVM = context.read<ScorersVM>();

    final daznTournamentName = settingsVM
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    programsVM.fetch();
    standingsVM.fetch(daznTournamentName);
    scorersVM.fetch(daznTournamentName);
  }
}
