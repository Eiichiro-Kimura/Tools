import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {

  BaseAppBar(String title, AnimationController animationController,
      void Function(BuildContext) callback, {List<Widget> actions}) : super(
    title: Text(title),
    actions: actions,
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: animationController,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: () => _onPressed(context, animationController, callback),
        );
      },
    ),
  );

  static void _onPressed(BuildContext context,
      AnimationController animationController,
      void Function(BuildContext) callback) =>
      animationController
          .forward()
          .then((_) {
            callback(context);
            animationController.reset();
          });
}
