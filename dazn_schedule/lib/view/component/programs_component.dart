import 'package:dazn_schedule/view/component/programs_card_component.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsComponent extends SingleChildScrollView {

  ProgramsComponent(BuildContext context,
      TextEditingController controller) : super(
      child: Column(
        children: _createWidgets(context, controller),
      )
  );

  static List<Widget> _createWidgets(BuildContext context,
      TextEditingController controller) {
    final widgets = <Widget>[];
    final programs = Provider.of<ProgramsViewModel>(context).programs;
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    final selectedGenre = settingsViewModel
        .get(SettingsKind.daznGenre)
        .value;
    final selectedTournamentName = settingsViewModel
        .get(SettingsKind.daznTournamentName)
        .value;

    if (null != programs) {
      for (final program in programs) {
        if (program.contains(controller.text, selectedGenre,
            selectedTournamentName)) {
          widgets.add(ProgramsCardComponent(context, program));
        }
      }
    }

    return widgets;
  }
}
