import 'package:flutter/material.dart';

class SnackBarNotice {

  static void show(BuildContext context, String message) =>
      Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
}
