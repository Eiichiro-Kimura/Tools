import 'package:dazn_schedule/google_calendar/google_calendar.dart';
import 'package:dazn_schedule/program_guide/program.dart';
import 'package:flutter/material.dart';

class ProgramCardView extends Card {

  ProgramCardView(GoogleCalendar googleCalendar, Program program): super(
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
        onTap: () {
          googleCalendar.add(program);
        },
      ),
    ),
  );
}