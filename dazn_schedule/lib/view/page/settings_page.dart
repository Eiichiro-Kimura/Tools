import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view/app_bar/simple_app_bar.dart';
import 'package:dazn_schedule/view/helper/page_manager.dart';
import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/view/view/setting_item_dropdown_view.dart';
import 'package:dazn_schedule/view/view/setting_item_text_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final _googleApiClientIdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _googleApiClientIdController.text = Provider
        .of<SettingsViewModel>(context, listen: false)
        .get(SettingsKind.googleApiClientId)
        .value;
  }

  @override
  Widget build(BuildContext context) {
    final settingsViewModel =
      Provider.of<SettingsViewModel>(context, listen: false);
    final programFilter =
      PageManager().getPrevArguments<ProgramFilter>(context);

    return Scaffold(
      appBar: SimpleAppBar(widget.title),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SettingItemTextView(
              settingsViewModel.get(SettingsKind.googleApiClientId),
              _googleApiClientIdController,
            ),
            SettingItemDropdownView(
              context,
              programFilter.genres,
              settingsViewModel.get(SettingsKind.daznGenre),
              _updateScreen,
            ),
            SettingItemDropdownView(
              context,
              programFilter.tournamentNames,
              settingsViewModel.get(SettingsKind.daznTournamentName),
              _updateScreen,
            ),
          ],
        ),
      ),
    );
  }

  void _updateScreen() =>
      setState(() {});
}
