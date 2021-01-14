import 'package:dazn_schedule/io/settings.dart';
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
              _settings.setStringValue(
                  SettingsKind.googleApiClientId, value
              );
            },
          ),
        ],
      ),
    );
  }
}
