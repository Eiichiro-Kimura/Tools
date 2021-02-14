import 'package:dazn_schedule/model/entity/favorite_team.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
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
      subtitle: Text(favoriteTeam.tournamentName),
      trailing: Text(favoriteTeam.genre),
      onTap: () => _onTapListTile(context, favoriteTeam),
    ),
  );

  static void _onPressedDelete(BuildContext context,
      FavoriteTeam favoriteTeam) =>
      context.read<FavoriteTeamsVM>().remove(favoriteTeam);

  static void _onTapListTile(BuildContext context, FavoriteTeam favoriteTeam) {
    context.read<CtrlHomeVM>().searchText.text = favoriteTeam.teamName;

    PageManager().backward(context);
  }
}
