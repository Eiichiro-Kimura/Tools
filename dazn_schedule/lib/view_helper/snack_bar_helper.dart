import 'package:flutter/material.dart';

class SnackBarHelper {

  static void show(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}