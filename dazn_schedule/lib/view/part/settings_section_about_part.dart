import 'package:dazn_schedule/view_model/system_info_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsSectionAboutPart extends Column {

  SettingsSectionAboutPart(BuildContext context) : super(
    children: [
      OutlineButton(
        child: const Text('About This Application'),
        onPressed: () => _onPressedAbout(context),
      ),
    ],
  );

  static void _onPressedAbout(BuildContext context) {
    final systemInfoVM = context.read<SystemInfoVM>();

    showLicensePage(
      context: context,
      applicationName: systemInfoVM.appName,
      applicationVersion: systemInfoVM.version,
      applicationLegalese: '2021 Eiichiro Kimura',
    );
  }
}
