import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

class SettingsSectionAboutPart extends Column {

  SettingsSectionAboutPart(BuildContext context) : super(
    children: [
      OutlineButton(
        child: const Text('About This Application'),
        onPressed: () => _onPressedAbout(context),
      ),
    ],
  );

  static Future<void> _onPressedAbout(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();

    showLicensePage(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      applicationLegalese: '2021 Eiichiro Kimura',
    );
  }
}
