import 'package:dazn_schedule/view/app_bar/settings_app_bar.dart';
import 'package:dazn_schedule/view/part/settings_section_about_part.dart';
import 'package:dazn_schedule/view/part/settings_section_favorites_part.dart';
import 'package:dazn_schedule/view/part/settings_section_general_part.dart';
import 'package:flutter/material.dart';

class SettingsScaffold extends Scaffold {

  SettingsScaffold(BuildContext context, String title) : super(
    appBar: SettingsAppBar(context, title),
    body: Padding(
      padding: const EdgeInsets.all(marginSize),
      child: Column(
        children: [
          SettingsSectionAboutPart(context),
          SettingsSectionGeneralPart(context),
          Expanded(
            child: SettingsSectionFavoritesPart(context),
          ),
        ],
      ),
    ),
  );

  static const double marginSize = 20;
}
