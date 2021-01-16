import 'package:dazn_schedule/io/settings.dart';
import 'package:flutter/material.dart';

class SettingItemTextView extends Row {

  SettingItemTextView(SettingsInfo settingsInfo,
      TextEditingController textEditingController): super(
    children: [
      Text(settingsInfo.name),
      const SizedBox(width: marginSize),
      Expanded(
        child: TextField(
          controller: textEditingController,
          maxLines: 1,
          onChanged: settingsInfo.updateValue,
        ),
      ),
      const SizedBox(width: marginSize),
    ],
  );

  static const double marginSize = 20;
}
