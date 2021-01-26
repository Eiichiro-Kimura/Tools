import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/part/settings_item_dropdown_part.dart';
import 'package:dazn_schedule/view/part/settings_item_text_part.dart';
import 'package:dazn_schedule/view/part/settings_title_part.dart';
import 'package:dazn_schedule/view_model/ctrl_settings_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsSectionGeneralPart extends Column {

  SettingsSectionGeneralPart(BuildContext context) : super(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SettingsTitlePart('General'),
        ],
      ),
      SettingsItemTextPart(
        context,
        context.watch<SettingsVM>().getSetting(SettingsKind.googleApiClientId),
        context.watch<CtrlSettingsVM>().googleApiClientIdText,
      ),
      SettingsItemDropdownPart(
        context,
        PageManager().getPrevArguments<ProgramFilter>(context).genres,
        context.watch<SettingsVM>().getSetting(SettingsKind.filterGenre),
      ),
      SettingsItemDropdownPart(
        context,
        PageManager().getPrevArguments<ProgramFilter>(context).tournamentNames,
        context.watch<SettingsVM>()
            .getSetting(SettingsKind.filterTournamentName)),
    ],
  );
}
