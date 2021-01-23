import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HomeController {

  HomeController(TickerProvider tickerProvider, VoidCallback callback) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeRotate),
          vsync: tickerProvider,
        ),
        trashAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeScale),
          vsync: tickerProvider,
        ),
        cancelAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeRotate),
          vsync: tickerProvider,
        ),
        calendarAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeScale),
          vsync: tickerProvider,
        ),
        settingsAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeRotate),
          vsync: tickerProvider,
        )
  {
    searchText.addListener(callback);
  }

  static const int animationTimeRotate = 300;
  static const int animationTimeScale = 100;
  final AnimationController menuAnimation;
  final AnimationController trashAnimation;
  final AnimationController cancelAnimation;
  final AnimationController calendarAnimation;
  final AnimationController settingsAnimation;
  final searchText = TextEditingController();

  void dispose() {
    menuAnimation.dispose();
    trashAnimation.dispose();
    cancelAnimation.dispose();
    calendarAnimation.dispose();
    settingsAnimation.dispose();
    searchText.dispose();
  }
}
