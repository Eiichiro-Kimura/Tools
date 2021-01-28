import 'package:dazn_schedule/common/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/part/icon_scale_part.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:dazn_schedule/view_model/system_info_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsAppBar extends BaseAppBar {

  SettingsAppBar(BuildContext context, String title) : super(
    title,
    AnimatedIcons.arrow_menu,
    context.watch<CtrlSettingsVM>().menuAnimation,
    (contextCB) => PageManager().backward(contextCB),
    actions: [
      Padding(
        padding: const EdgeInsets.all(_marginSize),
        child: IconButton(
          icon: IconScalePart(
            Icons.info,
            context.watch<CtrlSettingsVM>().aboutAnimation
          ),
          onPressed: () => _onPressedAbout(context),
        ),
      ),
    ],
  );

  static const double _marginSize = 8;

  static void _onPressedAbout(BuildContext context) =>
      context
          .read<CtrlSettingsVM>()
          .aboutAnimation
          .forwardReverse(() {
            final systemInfo = context.read<SystemInfoVM>().fetch();

            showLicensePage(
                context: context,
                applicationName: systemInfo.appName,
                applicationVersion: systemInfo.version,
                applicationLegalese: '2021 Eiichiro Kimura'
            );
          });
}
