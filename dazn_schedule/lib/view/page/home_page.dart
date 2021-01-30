import 'package:dazn_schedule/view/helper/manager/tab_manager.dart';
import 'package:dazn_schedule/view/scaffold/blank_scaffold.dart';
import 'package:dazn_schedule/view/scaffold/home_scaffold.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_vm.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:dazn_schedule/view_model/system_info_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
      _buildNormal(context) : _buildLoading(context);

  void _init() {
    final systemInfoVM = context.read<SystemInfoVM>();
    final settingsVM = context.read<SettingsVM>();
    final cloudCalendarVM = context.read<CloudCalendarVM>();
    final favoriteTeamsVM = context.read<FavoriteTeamsVM>();
    final ctrlHomeVM = context.read<CtrlHomeVM>();

    final apiClientId = settingsVM
        .getSetting(SettingsKind.googleApiClientId)
        .value;

    systemInfoVM.init();
    cloudCalendarVM.init(apiClientId);
    favoriteTeamsVM.init();
    ctrlHomeVM.setSearchTextCallback(_updateScreen);

    HomeScaffold.init(context);
  }

  Widget _buildNormal(BuildContext context) =>
      DefaultTabController(
        length: TabManager().tabCount,
        child: HomeScaffold(context, _scaffoldKey, widget.title),
      );

  Widget _buildLoading(BuildContext context) =>
      BlankScaffold(widget.title);

  void _updateScreen() => setState(() {});
}
