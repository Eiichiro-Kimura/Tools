import 'package:dazn_schedule/competition_standings/competition_standings.dart';
import 'package:dazn_schedule/competition_standings/team_standing.dart';
import 'package:flutter/material.dart';
import 'competition_standings_card_view.dart';

class HomeDrawer extends Drawer {

  HomeDrawer(String tournamentName) : super(
    child: Padding(
      padding: const EdgeInsets.only(top: marginSize),
      child: FutureBuilder<List<TeamStanding>>(
          future: CompetitionStandings().generate(tournamentName),
          builder: (BuildContext context,
              AsyncSnapshot<List<TeamStanding>> snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: _createWidgets(snapshot.data),
              ),
            );
          },
      ),
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

  static const double marginSize = 30;
}
