import 'package:dazn_schedule/view/page/home_page.dart';
import 'package:dazn_schedule/view/page/settings_page.dart';
import 'package:flutter/material.dart';

class PageManager {

  factory PageManager() => _instance;
  PageManager._internal();

  static final PageManager _instance = PageManager._internal();
  final Map<PageKind, PageInfo> _pageInfoMap = {
    PageKind.home:      PageInfo('/',         (context) => const HomePage(title: 'Dazn Schedule')),
    PageKind.settings:  PageInfo('/settings', (context) => const SettingsPage(title: 'Settings')),
  };

  String get initialRoute =>
      _pageInfoMap[PageKind.home].route;

  Map<String, WidgetBuilder> get routes {
    final routes = <String, WidgetBuilder>{};
    _pageInfoMap.forEach((key, value) => routes[value.route] = value.builder);

    return routes;
  }

  T getPrevArguments<T extends Object>(BuildContext context) =>
      ModalRoute.of(context).settings.arguments as T;

  Future<T> forward<T extends Object>(BuildContext context, PageKind pageKind,
      Object arguments) =>
      Navigator.of(context).pushNamed(
          _pageInfoMap[pageKind].route,
          arguments: arguments
      );
}

enum PageKind {
  home,
  settings,
}

class PageInfo {

  PageInfo(this.route, this.builder);

  final String route;
  final WidgetBuilder builder;
}