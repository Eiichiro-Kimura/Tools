import 'package:flutter/material.dart';

class SettingTitlePart extends Column {

  SettingTitlePart(String title) : super(
    children: [
      const Padding(
        padding: EdgeInsets.only(top: marginSize * 2),
      ),
      Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: marginSize),
      ),
    ],
  );

  static const double marginSize = 10;
}
