import 'package:flutter/material.dart';

class SettingsController {

  SettingsController(TickerProvider tickerProvider) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        );

  static const int animationTimeMS = 300;
  final AnimationController menuAnimation;
  final googleApiClientIdText = TextEditingController();

  void dispose() {
    menuAnimation.dispose();
    googleApiClientIdText.dispose();
  }
}
