import 'package:dazn_schedule/view/component/rotation_icon_component.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends FloatingActionButton {

  HomeFloatingActionButton(BuildContext context,
      AnimationController animationController, VoidCallback callback) : super(
    onPressed: () => _onPressed(context, animationController, callback),
    tooltip: 'Settings',
    child: RotationIconComponent(Icons.settings, animationController),
  );

  static void _onPressed(BuildContext context,
      AnimationController animationController, VoidCallback callback) =>
      animationController
          .forward()
          .then((_) {
            _toSettingPage(context, callback);
            animationController.reset();
          });

  static void _toSettingPage(BuildContext context, VoidCallback callback) {
    final programFilter = context.read<ProgramsViewModel>().programFilter;

    PageManager()
        .forward(context, PageKind.settings, programFilter)
        .then((_) => callback());
  }
}
