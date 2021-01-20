import 'package:dazn_schedule/model/setting.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingItemTextComponent extends Row {

  SettingItemTextComponent(BuildContext context, Setting setting,
      TextEditingController textEditingController): super(
    children: [
      Text(setting.name),
      const SizedBox(width: marginSize),
      Expanded(
        child: TextField(
          textAlign: TextAlign.end,
          controller: textEditingController,
          maxLines: 1,
          onChanged: (value) {
            context
                .read<SettingsViewModel>()
                .setValue(setting.settingsKind, value);
          }
        ),
      ),
    ],
  );

  static const double marginSize = 40;
}
