import 'package:flutter/material.dart';
import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';

class NormalAppBar extends BaseAppBar {

  NormalAppBar(String title, AnimationController animationController) : super(
    title,
    animationController,
    (context) => Scaffold.of(context).openDrawer()
  );
}
