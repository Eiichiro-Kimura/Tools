import 'package:dazn_schedule/view/scaffold/blank_scaffold.dart';
import 'package:dazn_schedule/view/scaffold/home_scaffold.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_vm.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    context
        .read<SettingsVM>()
        .init()
        .then((_) => _init());
  }

  @override
  Widget build(BuildContext context) =>
      context.watch<SettingsVM>().isValid ?
        HomeScaffold(context, widget.title) : BlankScaffold(widget.title);

  void _init() {
    final settingsVM = context.read<SettingsVM>();
    final cloudCalendarVM = context.read<CloudCalendarVM>();
    final favoriteTeamsVM = context.read<FavoriteTeamsVM>();
    final ctrlHomeVM = context.read<CtrlHomeVM>();

    final apiClientId = settingsVM
        .getSetting(SettingsKind.googleApiClientId)
        .value;

    cloudCalendarVM.init(apiClientId);
    favoriteTeamsVM.init();
    ctrlHomeVM.setSearchTextCallback(_updateScreen);

    HomeScaffold.init(context);
  }

  void _updateScreen() => setState(() {});
}
