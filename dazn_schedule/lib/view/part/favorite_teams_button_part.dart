import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/program.dart';
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
      _createMenuItemPart(context, program.genre, program.homeTeamName),
      _createMenuItemPart(context, program.genre, program.awayTeamName),
    ],
  );

  static void _onSelected(BuildContext context, Program program,
      String teamName) {

    final favoriteTeamsVM = context.read<FavoriteTeamsVM>();
    final favoriteTeam = FavoriteTeam.withData(program.genre, teamName);

    if (favoriteTeamsVM.contains(favoriteTeam)) {
      favoriteTeamsVM.remove(favoriteTeam);
    } else {
      favoriteTeamsVM.save(favoriteTeam);
    }
  }

  static FavoriteTeamsMenuItemPart _createMenuItemPart(BuildContext context,
      String genre, String teamName) =>
      FavoriteTeamsMenuItemPart(
          context,
          teamName,
          isSelected: _isFavorite(context, genre, teamName, false)
      );

  static bool _isFavoriteProgram(BuildContext context, Program program) =>
      _isFavorite(context, program.genre, program.homeTeamName, true) ||
      _isFavorite(context, program.genre, program.awayTeamName, true);

  static bool _isFavorite(BuildContext context, String genre,
      String teamName, bool isWatch) {
    final favoriteTeamsVM = isWatch ?
      context.read<FavoriteTeamsVM>() :
      context.read<FavoriteTeamsVM>();

    return favoriteTeamsVM.contains(FavoriteTeam.withData(genre, teamName));
  }
}
