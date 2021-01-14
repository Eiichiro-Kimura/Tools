import 'package:dazn_schedule/page/home_page.dart';
import 'package:dazn_schedule/page/settings_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dazn Schedule',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/':          (context) => const HomePage(title: 'Dazn Schedule'),
        '/settings':  (context) => const SettingsPage(title: 'Settings'),
      },
    );
  }
}
