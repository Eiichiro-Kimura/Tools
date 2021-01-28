import 'package:dazn_schedule/view/app_bar/settings_app_bar.dart';
import 'package:dazn_schedule/view/part/settings_section_favorites_part.dart';
import 'package:dazn_schedule/view/part/settings_section_general_part.dart';
import 'package:flutter/material.dart';

class SettingsScaffold extends Scaffold {

  SettingsScaffold(BuildContext context, String title) : super(
    appBar: SettingsAppBar(context, title),
    body: Padding(
      padding: const EdgeInsets.all(_marginSize),
      child: Column(
        children: [
          SettingsSectionGeneralPart(context),
          Expanded(
            child: SettingsSectionFavoritesPart(context),
          ),
        ],
      ),
    ),
  );

  static const double _marginSize = 20;
}
