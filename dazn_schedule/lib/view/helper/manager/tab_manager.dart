import 'package:dazn_schedule/common/extensions/build_context_extension.dart';
import 'package:dazn_schedule/view/helper/notice/snack_bar_notice.dart';
import 'package:dazn_schedule/view/part/programs_part.dart';
import 'package:dazn_schedule/view/part/scorers_part.dart';
import 'package:dazn_schedule/view/part/search_part.dart';
import 'package:dazn_schedule/view/part/standings_part.dart';
import 'package:flutter/material.dart';

class TabManager {

  factory TabManager() => _instance;

  TabManager._internal();

  static final TabManager _instance = TabManager._internal();
  static const double _marginSize = 8;
  final List<_TabDetail> _tabDetails = [
    _TabDetail(
      'Programs',
      (context) => Column(
        children: [
          SearchPart(context),
          Expanded(
            child: ProgramsPart(context),
          ),
        ],
      ),
    ),
    _TabDetail(
      'Standings',
      (context) => StandingsPart(context),
    ),
    _TabDetail(
      'Scorers',
      (context) => ScorersPart(context),
    ),
  ];

  int get tabCount => _tabDetails.length;

  PreferredSizeWidget createTabBar(BuildContext context,
      GlobalKey<ScaffoldState> scaffoldKey) =>
      TabBar(
        tabs: _tabDetails.map(_createTabWidget).toList(),
        onTap: (_) => _onTabTap(context, scaffoldKey),
      );

  Widget createTabBarView(BuildContext context) =>
      TabBarView(
          children: _tabDetails
              .map((tabDetail) => tabDetail.tabWidgetBuilder(context))
              .toList(),
      );

  Widget _createTabWidget(_TabDetail tabDetail) =>
      Container(
        padding: const EdgeInsets.all(_marginSize),
        child: Text(tabDetail.name),
      );

  void _onTabTap(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
    context.hideKeyboard();
    SnackBarNotice.hide(scaffoldKey.currentState);
  }
}

class _TabDetail {

  _TabDetail(this.name, this.tabWidgetBuilder);

  final String name;
  final WidgetBuilder tabWidgetBuilder;
}
