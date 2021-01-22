import 'package:flutter/material.dart';

class NormalAppBar extends AppBar {

  NormalAppBar(String title, AnimationController animationController) : super(
    title: Text(title),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: animationController,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: () => _onPressed(context, animationController),
        );
      },
    ),
  );

  static void _onPressed(BuildContext context,
      AnimationController animationController) =>
      animationController
          .forward()
          .then((_) {
            Scaffold.of(context).openDrawer();
            animationController.reset();
          });
}
