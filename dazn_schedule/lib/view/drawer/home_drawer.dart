import 'package:flutter/material.dart';
import '../view/competition_standings_view.dart';

class HomeDrawer extends Drawer {

  HomeDrawer(BuildContext context) : super(
    child: Padding(
      padding: const EdgeInsets.only(top: marginSize),
      child: CompetitionStandingsView(context),
    ),
  );

  static const double marginSize = 30;
}
