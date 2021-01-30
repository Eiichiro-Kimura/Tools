import 'package:flutter/material.dart';

class SnackBarNotice {

  static void show(BuildContext context, String message) =>
      showWithContent(
          context,
          Text(message),
          const Duration(milliseconds: 4000)
      );

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
