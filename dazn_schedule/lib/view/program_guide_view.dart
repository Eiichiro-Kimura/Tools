import 'package:dazn_schedule/google_calendar/google_calendar.dart';
import 'package:dazn_schedule/program_guide/program.dart';
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
          widgets.add(
            Card(
              margin: const EdgeInsets.all(10),
              child: Container(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Text(
                    '${program.date}\n${program.time}',
                    textScaleFactor: 0.9,
                  ),
                  title: Text(program.programName),
                  subtitle: Text(program.tournamentName),
                  trailing: Text(
                    program.genre,
                    textScaleFactor: 0.9,
                  ),
                  onTap: () { _googleCalendar.add(program); },
                ),
              ),
            ),
          );
        }
      }
    }

    return widgets;
  }
}
