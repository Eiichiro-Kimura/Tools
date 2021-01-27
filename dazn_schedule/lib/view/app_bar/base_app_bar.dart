import 'package:dazn_schedule/common/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/common/types/functions.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {

  BaseAppBar(String title, AnimatedIconData animatedIconData,
      AnimationController animationController,
      BuildContextCallback callback, {List<Widget> actions}) : super(
    title: Text(title),
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: AnimatedIcon(
            icon: animatedIconData,
            progress: animationController,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          onPressed: () => _onPressedMenu(
              context,
              animationController,
              callback
          ),
        );
      },
    ),
    actions: actions,
  );

  static void _onPressedMenu(BuildContext context,
      AnimationController animationController, BuildContextCallback callback) =>
      animationController.forwardReset(() => callback(context));
}
