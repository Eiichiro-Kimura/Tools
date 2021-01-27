import 'package:dazn_schedule/view/app_bar/normal_app_bar.dart';
import 'package:dazn_schedule/view/drawer/home_drawer.dart';
import 'package:dazn_schedule/view/floating_action_button/home_floating_action_button.dart';
import 'package:dazn_schedule/view/part/programs_part.dart';
import 'package:dazn_schedule/view/part/search_part.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:dazn_schedule/view_model/standings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScaffold extends Scaffold {

  HomeScaffold(BuildContext context, String title) : super(
    appBar: NormalAppBar(context, title),
    drawer: HomeDrawer(context),
    body: Column(
      children: [
        SearchPart(context),
        Expanded(
          child: ProgramsPart(context),
        ),
      ],
    ),
    floatingActionButton: HomeFloatingActionButton(
      context,
      () => init(context),
    ),
  );

  static void init(BuildContext context) {
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
