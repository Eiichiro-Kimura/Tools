import 'package:dazn_schedule/view/component/programs_card_component.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsComponent extends SingleChildScrollView {

  ProgramsComponent(BuildContext context, String keyword) : super(
      child: Column(
        children: _createWidgets(context, keyword),
      )
  );

  static List<Widget> _createWidgets(BuildContext context, String keyword) {
    final widgets = <Widget>[];
    final programs = context.watch<ProgramsViewModel>().value;
    final settingsViewModel = context.watch<SettingsViewModel>();
    final selectedGenre = settingsViewModel
        .get(SettingsKind.daznGenre)
        .value;
    final selectedTournamentName = settingsViewModel
        .get(SettingsKind.daznTournamentName)
        .value;

    if (null != programs) {
      for (final program in programs) {
        if (program.contains(keyword, selectedGenre, selectedTournamentName)) {
          widgets.add(ProgramsCardComponent(context, program));
        }
      }
    }

    return widgets;
  }
}
