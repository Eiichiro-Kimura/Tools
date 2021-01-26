import 'package:dazn_schedule/view/helper/manager/locale_manager.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/helper/manager/provider_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRoot extends StatefulWidget {

  const AppRoot({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AppRootState createState() => _AppRootState();
}

class _AppRootState extends State<AppRoot>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderManager(this).providers,
      child: MaterialApp(
        title: 'Dazn Schedule',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: LocaleManager().localizationsDelegates,
        supportedLocales: LocaleManager().supportedLocales,
        initialRoute: PageManager().initialRoute,
        routes: PageManager().routes,
      ),
    );
  }
}
