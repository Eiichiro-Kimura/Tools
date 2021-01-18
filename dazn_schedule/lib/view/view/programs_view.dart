import 'package:dazn_schedule/model/io/google_calendar.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:dazn_schedule/view_model/program_view_model.dart';
import 'package:dazn_schedule/view/view/programs_card_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsView extends SingleChildScrollView {

  ProgramsView(BuildContext context, TextEditingController controller) : super(
      child: Column(
        children: _createWidgets(context, controller),
      )
  );

  static List<Widget> _createWidgets(BuildContext context,
      TextEditingController controller) {
    final widgets = <Widget>[];
    final programs = Provider.of<ProgramViewModel>(context).programs;
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    final googleApiClientId = settingsViewModel
        .get(SettingsKind.googleApiClientId)
        .value;
    final selectedGenre = settingsViewModel
        .get(SettingsKind.daznGenre)
        .value;
    final selectedTournamentName = settingsViewModel
        .get(SettingsKind.daznTournamentName)
        .value;
    final googleCalendar = GoogleCalendar(googleApiClientId);

    if (null != programs) {
      for (final program in programs) {
        if (program.contains(controller.text, selectedGenre,
            selectedTournamentName)) {
          widgets.add(ProgramsCardView(googleCalendar, program));
        }
      }
    }

    return widgets;
  }
}
