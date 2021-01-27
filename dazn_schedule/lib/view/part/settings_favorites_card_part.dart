import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsFavoritesCardPart extends Card {

  SettingsFavoritesCardPart(BuildContext context,
      FavoriteTeam favoriteTeam) : super(
    child: ListTile(
      leading: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => _onPressedDelete(context, favoriteTeam),
      ),
      title: Text(favoriteTeam.teamName),
      subtitle: Text(favoriteTeam.genre),
    ),
  );

  static void _onPressedDelete(BuildContext context,
      FavoriteTeam favoriteTeam) =>
      context.read<FavoriteTeamsVM>().remove(favoriteTeam);
}