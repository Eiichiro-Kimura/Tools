import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

enum LocaleKind {
  en,
  ja,
}

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
  final Map<LocaleKind, Locale> _locales = const {
    LocaleKind.en : Locale('en'),
    LocaleKind.ja : Locale('ja'),
  };

  Iterable<Locale> get supportedLocales => _locales.values;

  Locale getLocale(LocaleKind localeKind) => _locales[localeKind];
}
