import 'package:dazn_schedule/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/view/part/scale_icon_part.dart';
import 'package:dazn_schedule/view_model/favorite_team_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingFavoritesCardPart extends Card {

  SettingFavoritesCardPart(BuildContext context,
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
      context.read<FavoriteTeamViewModel>().remove(favoriteTeam);
}
