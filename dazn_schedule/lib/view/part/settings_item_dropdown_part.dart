import 'package:dazn_schedule/model/entity/setting.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsItemDropdownPart extends Row {

  SettingsItemDropdownPart(BuildContext context, List<String> textList,
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
      onChanged: (value) => _onChanged(context, setting, value),
    );
  }

  static void _onChanged(BuildContext context, Setting setting, String value) =>
      context.read<SettingsVM>().setValue(setting.settingsKind, value);
}
