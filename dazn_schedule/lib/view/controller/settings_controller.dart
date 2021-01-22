import 'package:flutter/material.dart';

class SettingsController {

  final googleApiClientIdTextController = TextEditingController();

  void dispose() {
    googleApiClientIdTextController.dispose();
  }
}
