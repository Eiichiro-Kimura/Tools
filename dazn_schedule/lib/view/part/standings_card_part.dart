import 'package:dazn_schedule/model/entity/team.dart';
import 'package:dazn_schedule/model/entity/team_standing.dart';
import 'package:dazn_schedule/view/helper/notice/snack_bar_notice.dart';
import 'package:dazn_schedule/view_model/teams_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StandingsCardPart extends Card {

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

    SnackBarNotice.showWithContent(
        context,
        _createSnackBarWidget(context, team),
        const Duration(minutes: 1)
    );
  }

  static Widget _createSnackBarWidget(BuildContext context, Team team) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createSnackBarRowWidget(context, 'Name', team.name),
          _createSnackBarRowWidget(context, 'Phone', team.phone),
          _createSnackBarRowWidget(context, 'Website', team.website),
          _createSnackBarRowWidget(context, 'Email', team.email),
          _createSnackBarRowWidget(context, 'ClubColors', team.clubColors),
          _createSnackBarRowWidget(context, 'Venue', team.venue),
          _createSnackBarRowWidget(context, 'Address', team.address),
        ],
      );

  static Widget _createSnackBarRowWidget(BuildContext context, String name,
      String value) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$name ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              value ?? 'Unknown',
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ],
      );
}

