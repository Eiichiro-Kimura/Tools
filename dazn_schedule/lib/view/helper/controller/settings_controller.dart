import 'package:flutter/material.dart';

class SettingsController {

  SettingsController(TickerProvider tickerProvider) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTime),
          vsync: tickerProvider,
        );

  static const int animationTime = 300;
  final AnimationController menuAnimation;
  final googleApiClientIdText = TextEditingController();

  void dispose() {
    menuAnimation.dispose();
    googleApiClientIdText.dispose();
  }
}
