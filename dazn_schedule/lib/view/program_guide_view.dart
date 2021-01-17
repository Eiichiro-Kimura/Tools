import 'package:dazn_schedule/io/google_calendar.dart';
import 'package:dazn_schedule/program_guide/program.dart';
import 'package:dazn_schedule/view/program_card_view.dart';
import 'package:flutter/material.dart';

class ProgramGuideView extends SingleChildScrollView {

  ProgramGuideView(BuildContext context, List<Program> programs,
      TextEditingController controller, String googleApiClientId,
      String selectedGenre, String selectedTournamentName) : super(
      child: Column(
        children: _createWidgets(
            context,
            programs,
            controller,
            googleApiClientId,
            selectedGenre,
            selectedTournamentName
        ),
      )
  );

  static List<Widget> _createWidgets(BuildContext context,
      List<Program> programs, TextEditingController controller,
      String googleApiClientId, String selectedGenre,
      String selectedTournamentName) {
    final googleCalendar = GoogleCalendar(googleApiClientId);
    final widgets = <Widget>[];

    if (null != programs) {
      for (final program in programs) {
        if (program.contains(controller.text, selectedGenre,
            selectedTournamentName)) {

          widgets.add(ProgramCardView(googleCalendar, program));
        }
      }
    }

    return widgets;
  }
}
