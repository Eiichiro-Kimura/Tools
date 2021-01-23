import 'package:dazn_schedule/view/part/standings_part.dart';
import 'package:flutter/material.dart';

class HomeDrawer extends Drawer {

  HomeDrawer(BuildContext context) : super(
    child: Padding(
      padding: const EdgeInsets.only(top: marginSize),
      child: StandingsPart(context),
    ),
  );

  static const double marginSize = 30;
}
