import 'package:dazn_schedule/model/entity/team_standing.dart';
import 'package:dazn_schedule/view/mixin/snack_bar_information_mixin.dart';
import 'package:dazn_schedule/view_model/teams_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandingsCardPart extends Card with SnackBarInformationMixin {

  StandingsCardPart(TeamStanding teamStanding): super(
    margin: const EdgeInsets.all(_marginSize),
    child: Builder(
      builder: (context) {
        return Container(
          child: ListTile(
            contentPadding: const EdgeInsets.all(_marginSize),
            leading: Text('${teamStanding.position}位'),
            title: Text('${teamStanding.teamName}'),
            subtitle: Text('''${teamStanding.won}勝${teamStanding.draw}分${teamStanding.lost}敗'''),
            trailing: Text('${teamStanding.points}PT'),
            onTap: () => _onTapListTile(context, teamStanding),
          ),
        );
      },
    ),
  );

  static const double _marginSize = 10;

  static Future<void> _onTapListTile(BuildContext context,
      TeamStanding teamStanding) async {

    final team = await context.read<TeamsVM>().fetch(teamStanding.teamId);

    SnackBarInformationMixin.showSnackBar(context, team.toMap());
  }
}

