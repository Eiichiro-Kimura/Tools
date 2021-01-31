import 'package:dazn_schedule/common/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/common/types/functions.dart';
import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {

  BaseAppBar(String title, AnimatedIconData menuIconData,
      AnimationController menuAnimationController,
      BuildContextCallback menuCallback,
      PreferredSizeWidget bottomWidget,
      {List<Widget> actions}) : super(

    title: Text(title),
    leading: null == menuAnimationController ? null : _createLeadingWidget(
        menuIconData,
        menuAnimationController,
        menuCallback
    ),
    bottom: bottomWidget,
    actions: actions,
  );

  static Widget _createLeadingWidget(AnimatedIconData menuIconData,
      AnimationController menuAnimationController,
      BuildContextCallback menuCallback) =>
      Builder(
        builder: (context) =>
            IconButton(
              icon: AnimatedIcon(
                icon: menuIconData,
                progress: menuAnimationController,
              ),
              color: Theme.of(context).scaffoldBackgroundColor,
              onPressed: () => _onPressedMenu(
                  context,
                  menuAnimationController,
                  menuCallback
              ),
            )
      );

  static void _onPressedMenu(BuildContext context,
      AnimationController menuAnimationController,
      BuildContextCallback menuCallback) =>
      menuAnimationController.forwardReset(() => menuCallback(context));
}
