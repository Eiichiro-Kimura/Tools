import 'package:dazn_schedule/model/setting.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingItemDropdownPart extends Row {

  SettingItemDropdownPart(BuildContext context, List<String> textList,
      Setting setting) : super(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(setting.name),
      _createDropdownButton(context, textList, setting),
    ],
  );

  static const double marginSize = 20;

  static DropdownButton _createDropdownButton(BuildContext context,
      List<String> textList, Setting setting) {

    final valueText = setting.value.isEmpty ? textList[0] : setting.value;

    return DropdownButton<String>(
      value: valueText,
      items: textList.map((text) {
        return DropdownMenuItem<String>(
          value: text,
          child: Text(text),
        );
      }).toList(),
      onChanged: (value) {
        context.read<SettingsViewModel>().setValue(setting.settingsKind, value);
      }
    );
  }
}
