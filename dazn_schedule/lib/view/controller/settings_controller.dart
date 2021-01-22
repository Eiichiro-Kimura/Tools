import 'package:flutter/material.dart';

class SettingsController {

  final googleApiClientIdText = TextEditingController();

  void dispose() {
    googleApiClientIdText.dispose();
  }
}
