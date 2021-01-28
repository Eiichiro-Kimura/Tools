import 'package:dazn_schedule/model/entity/team_standing.dart';
import 'package:flutter/material.dart';

class StandingsCardPart extends Card {

  StandingsCardPart(TeamStanding teamStanding): super(
    margin: const EdgeInsets.all(_marginSize),
    child: Container(
      child: ListTile(
        contentPadding: const EdgeInsets.all(_marginSize),
        leading: Text('${teamStanding.position}位'),
        title: Text('${teamStanding.teamName}'),
        subtitle: Text('''${teamStanding.won}勝${teamStanding.draw}分${teamStanding.lost}敗'''),
        trailing: Text('${teamStanding.points}PT'),
      ),
    ),
  );

  static const double _marginSize = 10;
}

