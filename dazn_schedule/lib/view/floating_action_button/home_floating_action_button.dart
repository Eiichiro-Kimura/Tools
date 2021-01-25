import 'package:dazn_schedule/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/part/icon_rotation_part.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends FloatingActionButton {

  HomeFloatingActionButton(BuildContext context,
      AnimationController animationController, VoidCallback callback) : super(
    onPressed: () => _onPressedSettings(context, animationController, callback),
    child: IconRotationPart(Icons.settings, animationController),
  );

  static void _onPressedSettings(BuildContext context,
      AnimationController animationController, VoidCallback callback) =>
      animationController.forwardReset(() {
        final programFilter = context.read<ProgramsViewModel>().programFilter;

        PageManager()
            .forward(context, PageKind.settings, programFilter)
            .then((_) => callback());
      });
}
