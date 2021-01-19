import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/view/helper/snack_bar_helper.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsCardComponent extends Card {

  ProgramsCardComponent(BuildContext context, Program program): super(
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
        onTap: () => _onTap(context, program),
      ),
    ),
  );

  static const double marginSize = 10;
  static const double textScale = 0.9;

  static void _onTap(BuildContext context, Program program) {
    try {
      Provider.of<CloudCalendarViewModel>(context, listen: false).add(program);
    } on Exception catch (ex) {
      SnackBarHelper.show(context, 'エラーが発生しました[${ex.toString()}]');
    }
  }
}