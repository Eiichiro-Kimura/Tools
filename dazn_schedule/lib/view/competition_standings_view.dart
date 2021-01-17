import 'package:dazn_schedule/competition_standings/team_standing.dart';
import 'package:dazn_schedule/view/competition_standings_card_view.dart';
import 'package:flutter/material.dart';

class CompetitionStandingsView extends SingleChildScrollView {

  CompetitionStandingsView(List<TeamStanding> teamStandings) : super(
    child: Column(
      children: _createWidgets(teamStandings),
    ),
  );

  static List<Widget> _createWidgets(List<TeamStanding> teamStandings) {
    var widgets = <Widget>[];

    if (null != teamStandings) {
      widgets = teamStandings
          .map((teamStanding) => CompetitionStandingsCardView(teamStanding))
          .toList();
    }

    return widgets;
  }
}
