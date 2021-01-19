import 'package:dazn_schedule/model/setting.dart';
import 'package:flutter/material.dart';

class SettingItemTextComponent extends Row {

  SettingItemTextComponent(Setting setting,
      TextEditingController textEditingController): super(
    children: [
      Text(setting.name),
      const SizedBox(width: marginSize),
      Expanded(
        child: TextField(
          textAlign: TextAlign.end,
          controller: textEditingController,
          maxLines: 1,
          onChanged: setting.updateValue,
        ),
      ),
    ],
  );

  static const double marginSize = 40;
}
