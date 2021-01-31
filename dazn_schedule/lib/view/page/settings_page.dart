import 'package:dazn_schedule/view/scaffold/settings_scaffold.dart';
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
  Widget build(BuildContext context) => SettingsScaffold(context, widget.title);
}
