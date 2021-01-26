import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LocaleManager {

  factory LocaleManager() => _instance;
  LocaleManager._internal();

  static final LocaleManager _instance = LocaleManager._internal();
  final Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = const
  [
    GlobalMaterialLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  final Iterable<Locale> supportedLocales = const
  [
    Locale('en'),
    Locale('ja'),
  ];
}
