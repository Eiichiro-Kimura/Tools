import 'package:flutter/material.dart';

class SettingsTitlePart extends Column {

  SettingsTitlePart(String title) : super(
    children: [
      const Padding(
        padding: EdgeInsets.only(top: _marginSize * 2),
      ),
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: _marginSize),
      ),
    ],
  );

  static const double _marginSize = 5;
}
