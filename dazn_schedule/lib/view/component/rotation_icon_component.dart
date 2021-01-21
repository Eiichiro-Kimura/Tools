import 'package:flutter/material.dart';

class RotationIconComponent extends RotationTransition {

  RotationIconComponent(IconData iconData, AnimationController controller)
      : super(
    turns: Tween<double>(begin: tweenBegin, end: tweenEnd).animate(controller),
    child: Icon(iconData),
  );

  static const double tweenBegin = 0;
  static const double tweenEnd = 0.3;
}
