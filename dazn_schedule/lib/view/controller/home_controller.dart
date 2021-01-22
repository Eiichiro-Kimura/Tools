import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class HomeController {

  HomeController(TickerProvider tickerProvider) :
        menuAnimationController = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        ),
        cancelAnimationController = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        ),
        settingsAnimationController = AnimationController(
          duration: const Duration(milliseconds: animationTimeMS),
          vsync: tickerProvider,
        );

  static const int animationTimeMS = 300;
  final AnimationController menuAnimationController;
  final AnimationController cancelAnimationController;
  final AnimationController settingsAnimationController;
  final searchTextController = TextEditingController();

  void dispose() {
    menuAnimationController.dispose();
    cancelAnimationController.dispose();
    settingsAnimationController.dispose();
    searchTextController.dispose();
  }
}
