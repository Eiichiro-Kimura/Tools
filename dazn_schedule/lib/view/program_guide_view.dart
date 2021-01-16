import 'package:dazn_schedule/io/google_calendar.dart';
import 'package:dazn_schedule/program_guide/program.dart';
import 'package:dazn_schedule/view/program_card_view.dart';
import 'package:flutter/material.dart';

class ProgramGuideView extends SingleChildScrollView {

  ProgramGuideView(BuildContext context, AsyncSnapshot<List<Program>> snapshot,
      TextEditingController controller, String googleApiClientId,
      String selectedGenre, String selectedTournamentName) : super(
      child: Column(
        children: _createWidgets(
            context,
            snapshot,
            controller,
            googleApiClientId,
            selectedGenre,
            selectedTournamentName
        ),
      )
  );

  static List<Widget> _createWidgets(BuildContext context,
      AsyncSnapshot<List<Program>> snapshot, TextEditingController controller,
      String googleApiClientId, String selectedGenre,
      String selectedTournamentName) {
    final googleCalendar = GoogleCalendar(googleApiClientId);
    final widgets = <Widget>[];

    if (null != snapshot.data) {
      for (final program in snapshot.data) {
        if (program.contains(controller.text, selectedGenre,
            selectedTournamentName)) {

          widgets.add(ProgramCardView(googleCalendar, program));
        }
      }
    }

    return widgets;
  }
}
