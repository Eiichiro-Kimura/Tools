import 'package:dazn_schedule/model/entity/favorite_team.dart';
import 'package:dazn_schedule/model/entity/program.dart';
import 'package:dazn_schedule/view/part/favorite_teams_menu_item_part.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteTeamsButtonPart extends PopupMenuButton<String> {

  FavoriteTeamsButtonPart(BuildContext context, Program program) : super(
    child: Icon(
      _isFavoriteProgram(context, program) ?
        Icons.favorite : Icons.favorite_border,
      color: Theme.of(context).accentColor,
    ),
    onSelected: (teamName) => _onSelected(context, program, teamName),
    itemBuilder: (_) => [
      _createMenuItemPart(
          context,
          program.homeTeamName,
          program.genre,
          program.tournamentName
      ),
      _createMenuItemPart(
          context,
          program.awayTeamName,
          program.genre,
          program.tournamentName
      ),
    ],
  );

  static void _onSelected(BuildContext context, Program program,
      String teamName) {

    final favoriteTeamsVM = context.read<FavoriteTeamsVM>();
    final favoriteTeam = FavoriteTeam.withData(
        teamName,
        program.genre,
        program.tournamentName
    );

    if (favoriteTeamsVM.contains(favoriteTeam)) {
      favoriteTeamsVM.remove(favoriteTeam);
    } else {
      favoriteTeamsVM.save(favoriteTeam);
    }
  }

  static FavoriteTeamsMenuItemPart _createMenuItemPart(BuildContext context,
      String teamName, String genre, String tournamentName) =>
      FavoriteTeamsMenuItemPart(
          context,
          teamName,
          isSelected: _isFavorite(context, teamName, genre, tournamentName)
      );

  static bool _isFavoriteProgram(BuildContext context, Program program) =>
      _isFavorite(
          context,
          program.homeTeamName,
          program.genre,
          program.tournamentName
      ) ||
      _isFavorite(
          context,
          program.awayTeamName,
          program.genre,
          program.tournamentName
      );

  static bool _isFavorite(BuildContext context, String teamName, String genre,
      String tournamentName) =>
      context
          .read<FavoriteTeamsVM>()
          .contains(FavoriteTeam.withData(teamName, genre, tournamentName));
}
