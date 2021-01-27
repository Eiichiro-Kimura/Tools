import 'package:dazn_schedule/view/part/standings_card_part.dart';
import 'package:dazn_schedule/view_model/standings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandingsPart extends SingleChildScrollView {

  StandingsPart(BuildContext context) : super(
    child: Column(
      children: _createWidgets(context),
    ),
  );

  static List<Widget> _createWidgets(BuildContext context) {
    final teamStandings = context.watch<StandingsVM>().value;

    return null == teamStandings ? <Widget>[] : teamStandings
        .map((teamStanding) => StandingsCardPart(teamStanding))
        .toList();
  }
}
