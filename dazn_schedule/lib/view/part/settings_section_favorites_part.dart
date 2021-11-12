import 'package:dazn_schedule/view/part/settings_favorites_part.dart';
import 'package:dazn_schedule/view/part/settings_title_part.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsSectionFavoritesPart extends Column {

  SettingsSectionFavoritesPart(BuildContext context) : super(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SettingsTitlePart('Favorite List'),
            OutlinedButton(
              onPressed: () => _onPressedClear(context),
              child: const Text('Clear'),
            ),
          ],
        ),
        Expanded(
            child: SettingsFavoritesPart(context),
        ),
      ],
  );

  static void _onPressedClear(BuildContext context) =>
      context.read<FavoriteTeamsVM>().clear();
}
