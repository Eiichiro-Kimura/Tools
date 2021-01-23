import 'package:flutter/material.dart';

class ScaleIconPart extends ScaleTransition {

  ScaleIconPart(IconData iconData,
      AnimationController animationController) : super(
    scale: Tween<double>(begin: tweenBegin, end: tweenEnd)
            .animate(animationController),
    child: Icon(iconData),
  );

  static const double tweenBegin = 1;
  static const double tweenEnd = 1.25;
}
