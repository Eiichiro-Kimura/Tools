import 'package:dazn_schedule/model/setting.dart';
import 'package:flutter/material.dart';

class SettingItemDropdownComponent extends Row {

  SettingItemDropdownComponent(BuildContext context, List<String> textList,
      Setting setting, VoidCallback callback): super(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(setting.name),
      _createDropdownButton(context, textList, setting, callback),
    ],
  );

  static const double marginSize = 20;

  static DropdownButton _createDropdownButton(BuildContext context,
      List<String> textList, Setting setting, VoidCallback callback) {

    final valueText = setting.value.isEmpty ?
      textList[0] : setting.value;

    return DropdownButton<String>(
      value: valueText,
      items: textList.map((text) {
        return DropdownMenuItem<String>(
          value: text,
          child: Text(text),
        );
      }).toList(),
      onChanged: (value) {
        setting.updateValue(value);
        callback();
      },
    );
  }
}
