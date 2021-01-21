import 'package:flutter/material.dart';

class NormalAppBar extends AppBar {

  NormalAppBar(String title, AnimationController controller) : super(
    title: Text(title),
    leading: Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: controller,
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          onPressed: () => _onPressed(context, controller),
        );
      },
    ),
  );

  static void _onPressed(BuildContext context,
      AnimationController controller) =>
      controller.forward().then((_) {
        Scaffold.of(context).openDrawer();
        controller.reset();
      });
}
