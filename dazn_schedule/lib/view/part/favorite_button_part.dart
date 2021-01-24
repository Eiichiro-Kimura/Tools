import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/view/part/favorite_menu_item_part.dart';
import 'package:dazn_schedule/view_model/favorite_team_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButtonPart extends PopupMenuButton<String> {

  FavoriteButtonPart(BuildContext context, Program program) : super(
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

    final favoriteTeamViewModel = context.read<FavoriteTeamViewModel>();
    final favoriteTeam = _createFavoriteTeam(program.genre, teamName);

    if (favoriteTeamViewModel.contains(favoriteTeam)) {
      favoriteTeamViewModel.remove(favoriteTeam);
    } else {
      favoriteTeamViewModel.save(favoriteTeam);
    }
  }

  static FavoriteMenuItemPart _createMenuItemPart(BuildContext context,
      String genre, String teamName) =>
      FavoriteMenuItemPart(
          context,
          teamName,
          isSelected: _isFavorite(context, genre, teamName, false)
      );

  static bool _isFavoriteProgram(BuildContext context, Program program) =>
      _isFavorite(context, program.genre, program.homeTeamName, true) ||
      _isFavorite(context, program.genre, program.awayTeamName, true);

  static bool _isFavorite(BuildContext context, String genre,
      String teamName, bool isWatch) {
    final favoriteTeamViewModel = isWatch ?
      context.watch<FavoriteTeamViewModel>() :
      context.read<FavoriteTeamViewModel>();

    return favoriteTeamViewModel.contains(_createFavoriteTeam(genre, teamName));
  }

  static FavoriteTeam _createFavoriteTeam(String genre, String teamName) =>
      FavoriteTeam()
        ..genre = genre
        ..teamName = teamName;
}
