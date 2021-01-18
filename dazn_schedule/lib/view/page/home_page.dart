import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view_model/program_view_model.dart';
import 'package:dazn_schedule/view/app_bar/simple_app_bar.dart';
import 'package:dazn_schedule/view/app_bar/normal_app_bar.dart';
import 'package:dazn_schedule/view/drawer/home_drawer.dart';
import 'package:dazn_schedule/view/floating_action_button/home_floating_action_button.dart';
import 'package:dazn_schedule/view/view/programs_view.dart';
import 'package:dazn_schedule/view/view/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    Provider
        .of<SettingsViewModel>(context, listen: false)
        .init()
        .then((_) => _init());
  }

  @override
  Widget build(BuildContext context) =>
      Provider.of<SettingsViewModel>(context).isValid ?
        _buildNormal(context) : _buildLoading(context);

  Widget _buildLoading(BuildContext context) =>
      Scaffold(
        appBar: SimpleAppBar(widget.title),
      );

  Widget _buildNormal(BuildContext context) =>
      Scaffold(
        appBar: NormalAppBar(widget.title),
        drawer: HomeDrawer(context),
        body: Column(
          children: [
            SearchView(context, _controller, _updateScreen),
            Expanded(
              child: ProgramsView(context, _controller),
            ),
          ],
        ),
        floatingActionButton: HomeFloatingActionButton(context, _updateScreen),
      );

  void _init() =>
      Provider.of<ProgramViewModel>(context, listen: false).generate();

  void _updateScreen() =>
      setState(() {});
}
