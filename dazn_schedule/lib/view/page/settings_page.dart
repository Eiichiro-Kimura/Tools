import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/view/app_bar/settings_app_bar.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/part/setting_favorites_part.dart';
import 'package:dazn_schedule/view/part/setting_item_dropdown_part.dart';
import 'package:dazn_schedule/view/part/setting_item_text_part.dart';
import 'package:dazn_schedule/view/part/setting_title_part.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';
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
    final settingsVM = context.watch<SettingsVM>();
    final programFilter = PageManager()
        .getPrevArguments<ProgramFilter>(context);

    return Scaffold(
      appBar: SettingsAppBar(context, widget.title),
      body: Padding(
        padding: const EdgeInsets.all(marginSize),
        child: Column(
          children: [
            OutlineButton(
              child: const Text('About This Application'),
              onPressed: () => _onPressedAbout(context),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SettingTitlePart('Settings'),
              ],
            ),
            SettingItemTextPart(
              context,
              settingsVM.getSetting(SettingsKind.googleApiClientId),
              context.watch<CtrlSettingsVM>().googleApiClientIdText,
            ),
            SettingItemDropdownPart(
              context,
              programFilter.genres,
              settingsVM.getSetting(SettingsKind.filterGenre),
            ),
            SettingItemDropdownPart(
              context,
              programFilter.tournamentNames,
              settingsVM.getSetting(SettingsKind.filterTournamentName),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingTitlePart('Favorite List'),
                OutlineButton(
                  child: const Text('Clear'),
                  onPressed: () => _onPressedClear(context),
                ),
              ],
            ),
            Expanded(
              child: SettingFavoritesPart(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onPressedAbout(BuildContext context) async {
    final packageInfo = await PackageInfo.fromPlatform();

    showLicensePage(
      context: context,
      applicationName: packageInfo.appName,
      applicationVersion: packageInfo.version,
      applicationLegalese: '2021 Eiichiro Kimura',
    );
  }

  void _onPressedClear(BuildContext context) =>
      context.read<FavoriteTeamsVM>().clear();
}
