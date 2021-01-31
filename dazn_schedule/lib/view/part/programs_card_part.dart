import 'package:dazn_schedule/model/entity/program.dart';
import 'package:dazn_schedule/view/helper/notice/snack_bar_notice.dart';
import 'package:dazn_schedule/view/part/favorite_teams_button_part.dart';
import 'package:dazn_schedule/view_model/cloud_calendar_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsCardPart extends Card {

  ProgramsCardPart(Program program) : super(
    margin: const EdgeInsets.all(_marginSize),
    child: Builder(
      builder: (context) {
        return ListTile(
          contentPadding: const EdgeInsets.all(_marginSize),
          leading: Text(
            '${program.date}\n${program.time}',
            textScaleFactor: _textScale,
          ),
          title: Text(program.programName),
          subtitle: Text('${program.genre} : ${program.tournamentName}'),
          trailing: FavoriteTeamsButtonPart(context, program),
          onTap: () => _onTapListTile(context, program),
        );
      },
    ),
  );

  static const double _marginSize = 10;
  static const double _textScale = 0.9;

  static void _onTapListTile(BuildContext context, Program program) {
    try {
      context.read<CloudCalendarVM>().addEvent(program);
    } on Exception catch (ex) {
      SnackBarNotice.showWithMessage(
          context,
          'エラーが発生しました[${ex.toString()}]'
      );
    }
  }
}
