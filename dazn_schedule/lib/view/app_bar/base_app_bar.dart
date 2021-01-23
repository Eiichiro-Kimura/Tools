import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {

  BaseAppBar(String title, AnimationController animationController,
      void Function(BuildContext) callback, {List<Widget> actions}) : super(
    title: Text(title),
    leading: Builder(
      builder: (context) {
        return IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
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
      AnimationController animationController,
      void Function(BuildContext) callback) =>
      animationController
          .forward()
          .then(
              (_) => _onPressedMenuEnd(context, animationController, callback)
          );

  static void _onPressedMenuEnd(BuildContext context,
      AnimationController animationController,
      void Function(BuildContext) callback) {

    callback(context);
    animationController.reset();
  }
}
