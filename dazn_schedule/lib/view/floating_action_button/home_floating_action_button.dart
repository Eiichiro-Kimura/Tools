import 'package:dazn_schedule/view/helper/page_manager.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends FloatingActionButton {

  HomeFloatingActionButton(BuildContext context, VoidCallback callback) : super(
    onPressed: () => _toSettingPage(context, callback),
    tooltip: 'Settings',
    child: const Icon(Icons.settings),
  );

  static void _toSettingPage(BuildContext context, VoidCallback callback) =>
      PageManager()
          .forward(
            context,
            PageKind.settings,
            Provider.of<ProgramsViewModel>(context, listen: false).programFilter
          )
          .then((_) => callback())
  ;
}
