import 'package:dazn_schedule/view/component/standings_component.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends Drawer {

  HomeDrawer(BuildContext context) : super(
    child: Padding(
      padding: const EdgeInsets.only(top: marginSize),
      child: StandingsComponent(context),
    ),
  );

  static const double marginSize = 30;
}
