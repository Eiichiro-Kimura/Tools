import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/view/app_bar/simple_app_bar.dart';
import 'package:dazn_schedule/view/component/setting_item_dropdown_component.dart';
import 'package:dazn_schedule/view/component/setting_item_text_component.dart';
import 'package:dazn_schedule/view/helper/page_manager.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
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
  final _googleApiClientIdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _googleApiClientIdController.text = context
        .read<SettingsViewModel>()
        .getSetting(SettingsKind.googleApiClientId)
        .value;
  }

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = context.watch<SettingsViewModel>();
    final programFilter = PageManager()
        .getPrevArguments<ProgramFilter>(context);

    return Scaffold(
      appBar: SimpleAppBar(widget.title),
      body: Padding(
        padding: const EdgeInsets.all(marginSize),
        child: Column(
          children: [
            SettingItemTextComponent(
              context,
              settingsViewModel.getSetting(SettingsKind.googleApiClientId),
              _googleApiClientIdController,
            ),
            SettingItemDropdownComponent(
              context,
              programFilter.genres,
              settingsViewModel.getSetting(SettingsKind.daznGenre),
            ),
            SettingItemDropdownComponent(
              context,
              programFilter.tournamentNames,
              settingsViewModel.getSetting(SettingsKind.daznTournamentName),
            ),
          ],
        ),
      ),
    );
  }
}
