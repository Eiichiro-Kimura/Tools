import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HomeController {

  HomeController(TickerProvider tickerProvider, VoidCallback callback) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeRotate),
          vsync: tickerProvider,
        ),
        favoriteAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeScale),
          vsync: tickerProvider,
        ),
        trashAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeScale),
          vsync: tickerProvider,
        ),
        clearAnimation = AnimationController(
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
  final AnimationController favoriteAnimation;
  final AnimationController trashAnimation;
  final AnimationController clearAnimation;
  final AnimationController calendarAnimation;
  final AnimationController settingsAnimation;
  final searchText = TextEditingController();

  void dispose() {
    menuAnimation.dispose();
    favoriteAnimation.dispose();
    trashAnimation.dispose();
    clearAnimation.dispose();
    calendarAnimation.dispose();
    settingsAnimation.dispose();
    searchText.dispose();
  }
}
