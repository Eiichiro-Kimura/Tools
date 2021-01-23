import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:flutter/material.dart';
import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';

class SettingsAppBar extends BaseAppBar {

  SettingsAppBar(String title, AnimationController animationController) : super(
    title,
    animationController,
    (context) => PageManager().backward(context)
  );
}
