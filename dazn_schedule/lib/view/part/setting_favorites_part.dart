import 'package:dazn_schedule/view/part/setting_favorites_card_part.dart';
import 'package:dazn_schedule/view_model/favorite_team_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingFavoritesPart extends SingleChildScrollView {

  SettingFavoritesPart(BuildContext context) : super(
      child: SingleChildScrollView(
        child: Column(
          children: _createFavoriteParts(context),
        ),
      )
  );

  static List<Widget> _createFavoriteParts(BuildContext context) =>
      context
          .watch<FavoriteTeamViewModel>()
          .all
          .map((element) => SettingFavoritesCardPart(context, element))
          .toList();
}
