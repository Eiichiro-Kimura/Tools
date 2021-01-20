import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view_model/standings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalAppBar extends AppBar {

  NormalAppBar(String title) : super(
    title: Text(title),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(Icons.menu),
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: () => Scaffold.of(context).openDrawer(),
        );
      },
    ),
  );
}
