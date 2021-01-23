import 'package:flutter/material.dart';

class RotationIconPart extends RotationTransition {

  RotationIconPart(IconData iconData,
      AnimationController animationController) : super(
    turns: Tween<double>(begin: tweenBegin, end: tweenEnd)
        .animate(animationController),
    child: Icon(iconData),
  );

  static const double tweenBegin = 0;
  static const double tweenEnd = 0.3;
}
