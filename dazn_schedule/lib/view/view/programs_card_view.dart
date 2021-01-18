import 'package:dazn_schedule/model/io/google_calendar.dart';
import 'package:dazn_schedule/model/program.dart';
import 'package:flutter/material.dart';

class ProgramsCardView extends Card {

  ProgramsCardView(GoogleCalendar googleCalendar, Program program): super(
    margin: const EdgeInsets.all(marginSize),
    child: Container(
      child: ListTile(
        contentPadding: const EdgeInsets.all(marginSize),
        leading: Text(
          '${program.date}\n${program.time}',
          textScaleFactor: textScale,
        ),
        title: Text(program.programName),
        subtitle: Text(program.tournamentName),
        trailing: Text(program.genre, textScaleFactor: textScale),
        onTap: () {
          googleCalendar.add(program);
        },
      ),
    ),
  );

  static const double marginSize = 10;
  static const double textScale = 0.9;
}