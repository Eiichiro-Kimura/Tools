import 'package:dazn_schedule/view_model/competition_standings_view_model.dart';
import 'package:dazn_schedule/view/view/competition_standings_card_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompetitionStandingsView extends SingleChildScrollView {

  CompetitionStandingsView(BuildContext context) : super(
    child: Column(
      children: _createWidgets(context),
    ),
  );

  static List<Widget> _createWidgets(BuildContext context) {
    var widgets = <Widget>[];
    final teamStandings = Provider
        .of<CompetitionStandingsViewModel>(context)
        .teamStandings;

    if (null != teamStandings) {
      widgets = teamStandings
          .map((teamStanding) => CompetitionStandingsCardView(teamStanding))
          .toList();
    }

    return widgets;
  }
}
