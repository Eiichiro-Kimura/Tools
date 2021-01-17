import 'package:dazn_schedule/page/page_manager.dart';
import 'package:flutter/material.dart';

class AppView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dazn Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: PageManager().initialRoute,
      routes: PageManager().routes,
    );
  }
}
