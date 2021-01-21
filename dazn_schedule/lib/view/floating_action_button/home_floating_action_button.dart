import 'package:dazn_schedule/view/helper/page_manager.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends FloatingActionButton {

  HomeFloatingActionButton(BuildContext context, AnimationController controller,
      VoidCallback callback) : super(
    onPressed: () => _onPressed(context, controller, callback),
    tooltip: 'Settings',
    child: RotationTransition(
        turns: Tween<double>(begin: tweenBegin, end: tweenEnd)
            .animate(controller),
        child: const Icon(Icons.settings),
    ),
  );

  static const double tweenBegin = 0;
  static const double tweenEnd = 0.3;

  static void _onPressed(BuildContext context, AnimationController controller,
      VoidCallback callback) =>
      controller
          .forward()
          .then((_) {
            _toSettingPage(context, callback);
            controller.reset();
          });

  static void _toSettingPage(BuildContext context, VoidCallback callback) =>
      PageManager()
          .forward(
            context,
            PageKind.settings,
            context.read<ProgramsViewModel>().programFilter
          )
          .then((_) => callback());
}
