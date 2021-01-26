import 'package:dazn_schedule/view/app_bar/settings_app_bar.dart';
import 'package:dazn_schedule/view/part/settings_section_about_part.dart';
import 'package:dazn_schedule/view/part/settings_section_favorites_part.dart';
import 'package:dazn_schedule/view/part/settings_section_general_part.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  static const double marginSize = 20;

  @override
  void initState() {
    super.initState();

    final ctrlSettingsVM = context.read<CtrlSettingsVM>();
    final settingsVM = context.read<SettingsVM>();

    ctrlSettingsVM.googleApiClientIdText.text = settingsVM
        .getSetting(SettingsKind.googleApiClientId)
        .value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingsAppBar(context, widget.title),
      body: Padding(
        padding: const EdgeInsets.all(marginSize),
        child: Column(
          children: [
            SettingsSectionAboutPart(context),
            SettingsSectionGeneralPart(context),
            Expanded(
                child: SettingsSectionFavoritesPart(context),
            ),
          ],
        ),
      ),
    );
  }
}
