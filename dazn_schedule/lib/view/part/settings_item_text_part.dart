import 'package:dazn_schedule/model/entity/setting.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsItemTextPart extends Row {

  SettingsItemTextPart(BuildContext context, Setting setting,
      TextEditingController textEditingController) : super(
    children: [
      Text(setting.name),
      const SizedBox(width: _marginSize),
      Expanded(
        child: TextField(
          textAlign: TextAlign.end,
          controller: textEditingController,
          maxLines: 1,
          onChanged: (value) => _onChanged(context, setting, value),
        ),
      ),
    ],
  );

  static const double _marginSize = 40;

  static void _onChanged(BuildContext context, Setting setting, String value) =>
      context.read<SettingsVM>().setSetting(setting..value = value);
}
