import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/part/rotation_icon_part.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends FloatingActionButton {

  HomeFloatingActionButton(BuildContext context,
      AnimationController animationController, VoidCallback callback) : super(
    onPressed: () => _onPressedSettings(context, animationController, callback),
    child: RotationIconPart(Icons.settings, animationController),
  );

  static void _onPressedSettings(BuildContext context,
      AnimationController animationController, VoidCallback callback) =>

      animationController
          .forward()
          .then(
              (_) => _onPressedSettingsEnd(
                  context,
                  animationController,
                  callback
              )
          );

  static void _onPressedSettingsEnd(BuildContext context,
      AnimationController animationController, VoidCallback callback) {

    final programFilter = context.read<ProgramsViewModel>().programFilter;

    PageManager()
        .forward(context, PageKind.settings, programFilter)
        .then((_) => callback());

    animationController.reset();
  }
}
