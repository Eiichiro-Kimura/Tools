import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsAppBar extends BaseAppBar {

  SettingsAppBar(BuildContext context, String title) : super(
      title,
      AnimatedIcons.arrow_menu,
      context.watch<CtrlSettingsVM>().menuAnimation,
      (contextCB) => PageManager().backward(contextCB)
  );
}
