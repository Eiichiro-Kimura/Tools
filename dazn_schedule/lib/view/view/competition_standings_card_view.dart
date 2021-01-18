import 'package:dazn_schedule/model/team_standing.dart';
import 'package:flutter/material.dart';

class CompetitionStandingsCardView extends Card {

  CompetitionStandingsCardView(TeamStanding teamStanding): super(
    margin: const EdgeInsets.all(marginSize),
    child: Container(
      child: ListTile(
        contentPadding: const EdgeInsets.all(marginSize),
        leading: Text('${teamStanding.position}位'),
        title: Text('${teamStanding.teamName}'),
        subtitle: Text('''${teamStanding.won}勝${teamStanding.draw}分${teamStanding.lost}敗'''),
        trailing: Text('${teamStanding.points}PT'),
      ),
    ),
  );

  static const double marginSize = 10;
}

