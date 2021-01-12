import 'package:dazn_schedule/google_calendar/google_calendar.dart';
import 'package:dazn_schedule/program_guide/program.dart';
import 'package:dazn_schedule/view/program_card_view.dart';
import 'package:flutter/material.dart';

class ProgramGuideView extends SingleChildScrollView {

  ProgramGuideView(BuildContext context,
      AsyncSnapshot<List<Program>> snapshot,
      TextEditingController controller) : super(
      child: Column(
        children: _createWidgets(context, snapshot, controller),
      )
  );

  static final _googleCalendar = GoogleCalendar();

  static List<Widget> _createWidgets(BuildContext context,
      AsyncSnapshot<List<Program>> snapshot,
      TextEditingController controller) {
    final widgets = <Widget>[];

    if (null != snapshot.data) {
      for (final program in snapshot.data) {
        if (program.contains(controller.text)) {
          widgets.add(ProgramCardView(_googleCalendar, program));
        }
      }
    }

    return widgets;
  }
}
