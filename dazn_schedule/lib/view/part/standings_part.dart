import 'package:dazn_schedule/view/part/standings_card_part.dart';
import 'package:dazn_schedule/view_model/standings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandingsPart extends SingleChildScrollView {

  StandingsPart(BuildContext context) : super(
    child: Column(
      children: _createWidgets(context),
    ),
  );

  static List<Widget> _createWidgets(BuildContext context) {
    var widgets = <Widget>[];
    final teamStandings = context.watch<StandingsViewModel>().value;

    if (null != teamStandings) {
      widgets = teamStandings
          .map((teamStanding) => StandingsCardPart(teamStanding))
          .toList();
    }

    return widgets;
  }
}
