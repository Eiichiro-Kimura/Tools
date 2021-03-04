import 'package:flutter/material.dart';

class SnackBarNotice {

  static const _defaultDuration = Duration(milliseconds: 4000);

  static void showWithMessage(BuildContext context, String message) =>
      showWithContent(context, Text(message), _defaultDuration);

  static void showWithContent(BuildContext context, Widget content,
      Duration duration) {
    final scaffoldMessengerState = ScaffoldMessenger.of(context);
    final snackBar = SnackBar(
      content: content,
      duration: duration,
      action: SnackBarAction(
        label: 'Hide',
        onPressed: () => hide(scaffoldMessengerState),
      ),
    );

    hide(scaffoldMessengerState);

    scaffoldMessengerState.showSnackBar(snackBar);
  }

  static void hide(ScaffoldMessengerState scaffoldMessengerState) =>
      scaffoldMessengerState.hideCurrentSnackBar(
          reason: SnackBarClosedReason.hide
      );
}
