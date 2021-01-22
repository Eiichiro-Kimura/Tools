import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HomeController {

  HomeController(TickerProvider tickerProvider, VoidCallback callback) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        ),
        cancelAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        ),
        settingsAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        )
  {
    searchText.addListener(callback);
  }

  static const int animationTimeMS = 300;
  final AnimationController menuAnimation;
  final AnimationController cancelAnimation;
  final AnimationController settingsAnimation;
  final searchText = TextEditingController();

  void dispose() {
    menuAnimation.dispose();
    cancelAnimation.dispose();
    settingsAnimation.dispose();
    searchText.dispose();
  }
}
