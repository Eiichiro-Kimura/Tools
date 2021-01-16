import 'package:dazn_schedule/io/settings.dart';
import 'package:dazn_schedule/page/page_manager.dart';
import 'package:dazn_schedule/program_guide/program_filter.dart';
import 'package:dazn_schedule/view/setting_item_dropdown_view.dart';
import 'package:dazn_schedule/view/setting_item_text_view.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {

  const SettingsPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final _settings = Settings();
  final _googleApiClientIdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _settings.init().then((_) {
      setState(() {
        _googleApiClientIdController.text =
            _settings.get(SettingsKind.googleApiClientId).value;
      });
    });
  }

  @override
  Widget build(BuildContext context) =>
      _settings.isValid ? _buildNormal(context) : _buildLoading(context);

  Widget _buildLoading(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
      );

  Widget _buildNormal(BuildContext context) {
    final programFilter =
      PageManager().getPrevArguments<ProgramFilter>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SettingItemTextView(
            _settings.get(SettingsKind.googleApiClientId),
            _googleApiClientIdController,
          ),
          SettingItemDropdownView(
            context,
            programFilter.genres,
            _settings.get(SettingsKind.daznGenre),
            _updateScreen,
          ),
          SettingItemDropdownView(
            context,
            programFilter.tournamentNames,
            _settings.get(SettingsKind.daznTournamentName),
            _updateScreen,
          ),
        ],
      ),
    );
  }

  void _updateScreen() =>
      setState(() {});
}
