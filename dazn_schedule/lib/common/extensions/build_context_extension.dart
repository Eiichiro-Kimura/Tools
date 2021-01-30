import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {

  void hideKeyboard() {
    final currentFocus = FocusScope.of(this);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
