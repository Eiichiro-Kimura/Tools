import 'package:flutter/material.dart';

class SnackBarNotice {

  static const _defaultDuration = Duration(milliseconds: 4000);

  static void showWithMessage(BuildContext context, String message) =>
      showWithContent(context, Text(message), _defaultDuration);

  static void showWithContent(BuildContext context, Widget content,
      Duration duration) {
    final scaffoldState = Scaffold.of(context);
    final snackBar = SnackBar(
      content: content,
      duration: duration,
      action: SnackBarAction(
        label: 'Hide',
        onPressed: () => hide(scaffoldState),
      ),
    );

    hide(scaffoldState);

    scaffoldState.showSnackBar(snackBar);
  }

  static void hide(ScaffoldState scaffoldState) =>
      scaffoldState.hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
}
