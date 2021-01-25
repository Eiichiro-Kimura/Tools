import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class CtrlHomeVM extends ChangeNotifier {

  CtrlHomeVM(TickerProvider tickerProvider) :
        menuAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeRotate),
          vsync: tickerProvider,
        ),
        favoriteFilterAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeScale),
          vsync: tickerProvider,
        ),
        clearFilterAnimation = AnimationController(
          duration: const Duration(milliseconds: animationTimeScale),
          vsync: tickerProvider,
        ),
        clearSearchTextAnimation = AnimationController(
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
        );

  static const int animationTimeRotate = 300;
  static const int animationTimeScale = 100;
  final AnimationController menuAnimation;
  final AnimationController favoriteFilterAnimation;
  final AnimationController clearFilterAnimation;
  final AnimationController clearSearchTextAnimation;
  final AnimationController calendarAnimation;
  final AnimationController settingsAnimation;
  final searchText = TextEditingController();

  @override
  void dispose() {
    menuAnimation.dispose();
    favoriteFilterAnimation.dispose();
    clearFilterAnimation.dispose();
    clearSearchTextAnimation.dispose();
    calendarAnimation.dispose();
    settingsAnimation.dispose();
    searchText.dispose();

    super.dispose();
  }

  void setSearchTextCallback(VoidCallback searchTextCallback) =>
      searchText.addListener(searchTextCallback);
}
