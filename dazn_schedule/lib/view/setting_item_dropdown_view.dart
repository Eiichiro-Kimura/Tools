import 'package:dazn_schedule/io/settings.dart';
import 'package:flutter/material.dart';

typedef SettingItemDropdownCallback
  = void Function(SettingsKind settingsKind, String value);

class SettingItemDropdownView extends Row {

  SettingItemDropdownView(BuildContext context, SettingsKind settingsKind,
      String name, List<String> textList, String selectedText,
      SettingItemDropdownCallback callback): super(
    children: [
      Text(name),
      const SizedBox(width: marginSize),
      Expanded(
        child: _createDropdownButton(
            context,
            settingsKind,
            textList,
            selectedText,
            callback
        ),
      ),
      const SizedBox(width: marginSize),
    ],
  );

  static const double marginSize = 20;

  static DropdownButton _createDropdownButton(BuildContext context,
      SettingsKind settingsKind, List<String> textList, String selectedText,
      SettingItemDropdownCallback callback) {

    final selectedTextUse = selectedText.isEmpty ? textList[0] : selectedText;

    return DropdownButton<String>(
      value: selectedTextUse,
      items: textList.map((String text) {
        return DropdownMenuItem<String>(
          value: text,
          child: Text(text),
        );
      }).toList(),
      onChanged: (value) { callback(settingsKind, value); },
    );
  }
}
