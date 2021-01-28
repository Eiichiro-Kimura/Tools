import 'package:flutter/material.dart';

class CtrlSettingsVM extends ChangeNotifier {

  CtrlSettingsVM(TickerProvider tickerProvider) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTime),
          vsync: tickerProvider,
        ),
        aboutAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTime),
          vsync: tickerProvider,
        );

  static const int animationTime = 300;
  final AnimationController menuAnimation;
  final AnimationController aboutAnimation;
  final googleApiClientIdText = TextEditingController();

  @override
  void dispose() {
    menuAnimation.dispose();
    aboutAnimation.dispose();
    googleApiClientIdText.dispose();

    super.dispose();
  }
}
