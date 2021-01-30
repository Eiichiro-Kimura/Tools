import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:flutter/material.dart';

class ScorersCardPart extends Card {

  ScorersCardPart(int position, Scorer scorer): super(
    margin: const EdgeInsets.all(_marginSize),
    child: Container(
      child: ListTile(
        contentPadding: const EdgeInsets.all(_marginSize),
        leading: Text('$position位'),
        title: Text(scorer.playerName),
        subtitle: Text(scorer.teamName),
        trailing: Text('${scorer.goalCount}Goals'),
      ),
    ),
  );

  static const double _marginSize = 10;
}

