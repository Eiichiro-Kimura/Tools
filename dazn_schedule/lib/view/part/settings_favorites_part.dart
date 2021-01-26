import 'package:dazn_schedule/view/part/settings_favorites_card_part.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsFavoritesPart extends SingleChildScrollView {

  SettingsFavoritesPart(BuildContext context) : super(
    child: Column(
      children: _createFavoritesCardPart(context),
    ),
  );

  static List<Widget> _createFavoritesCardPart(BuildContext context) =>
      context
          .watch<FavoriteTeamsVM>()
          .all
          .map((element) => SettingsFavoritesCardPart(context, element))
          .toList();
}
