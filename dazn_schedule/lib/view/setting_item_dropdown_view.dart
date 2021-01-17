import 'package:dazn_schedule/io/settings.dart';
import 'package:flutter/material.dart';

class SettingItemDropdownView extends Row {

  SettingItemDropdownView(BuildContext context, List<String> textList,
      SettingsInfo settingsInfo, VoidCallback callback): super(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(settingsInfo.name),
      _createDropdownButton(context, textList, settingsInfo, callback),
    ],
  );

  static const double marginSize = 20;

  static DropdownButton _createDropdownButton(BuildContext context,
      List<String> textList, SettingsInfo settingsInfo, VoidCallback callback) {

    final valueText = settingsInfo.value.isEmpty ?
      textList[0] : settingsInfo.value;

    return DropdownButton<String>(
      value: valueText,
      items: textList.map((text) {
        return DropdownMenuItem<String>(
          value: text,
          child: Text(text),
        );
      }).toList(),
      onChanged: (value) {
        settingsInfo.updateValue(value);
        callback();
      },
    );
  }
}
