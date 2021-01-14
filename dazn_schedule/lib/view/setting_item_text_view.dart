import 'package:flutter/material.dart';

class SettingItemTextView extends Row {

  SettingItemTextView(String name, TextEditingController textEditingController,
      ValueChanged<String> onChanged) : super(
    children: [
      Text(name),
      const SizedBox(width: marginSize),
      Expanded(
        child: TextField(
          controller: textEditingController,
          maxLines: 1,
          onChanged: onChanged,
        ),
      ),
      const SizedBox(width: marginSize),
    ],
  );

  static const double marginSize = 20;
}
