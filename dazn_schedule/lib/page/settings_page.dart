import 'package:dazn_schedule/io/settings.dart';
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

    _settings.init().then((value) {
      setState(() {
        _googleApiClientIdController.text =
            _settings.getStringValue(SettingsKind.googleApiClientId);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _settings.isValid ? _buildNormal(context) : _buildLoading(context);
  }

  Widget _buildLoading(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
    );
  }

  Widget _buildNormal(BuildContext context) {
    final programFilter = ModalRoute.of(context).settings.arguments
      as ProgramFilter;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SettingItemTextView(
            _settings.getName(SettingsKind.googleApiClientId),
            _googleApiClientIdController,
            (value) {
              _settings.setStringValue(SettingsKind.googleApiClientId, value);
            },
          ),
          SettingItemDropdownView(
            context,
            SettingsKind.daznGenre,
            _settings.getName(SettingsKind.daznGenre),
            programFilter.genres,
            _settings.getStringValue(SettingsKind.daznGenre),
            _dropdownCallback,
          ),
          SettingItemDropdownView(
            context,
            SettingsKind.daznTournamentName,
            _settings.getName(SettingsKind.daznTournamentName),
            programFilter.tournamentNames,
            _settings.getStringValue(SettingsKind.daznTournamentName),
            _dropdownCallback,
          ),
        ],
      ),
    );
  }

  void _dropdownCallback(SettingsKind settingsKind, String value) {
    _settings.setStringValue(settingsKind, value);
    _updateScreen();
  }

  void _updateScreen() {
    setState(() {});
  }
}
