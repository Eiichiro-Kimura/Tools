import 'package:dazn_schedule/view_model/competition_standings_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalAppBar extends AppBar {

  NormalAppBar(String title) : super(
    title: Text(title),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: () => _onPressed(context)
        );
      },
    ),
  );

  static Future<void> _onPressed(BuildContext context) async {
      final daznTournamentName = Provider
          .of<SettingsViewModel>(context, listen: false)
          .get(SettingsKind.daznTournamentName)
          .value;

      await Provider
          .of<CompetitionStandingsViewModel>(context, listen: false)
          .generate(daznTournamentName);

      Scaffold.of(context).openDrawer();
  }
}
