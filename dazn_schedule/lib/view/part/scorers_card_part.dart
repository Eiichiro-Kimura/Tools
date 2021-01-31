import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:dazn_schedule/view/mixin/snack_bar_information_mixin.dart';
import 'package:flutter/material.dart';

class ScorersCardPart extends Card with SnackBarInformationMixin {

  ScorersCardPart(Scorer scorer) : super(
    margin: const EdgeInsets.all(_marginSize),
    child: Builder(
      builder: (context) {
        return Container(
          child: ListTile(
            contentPadding: const EdgeInsets.all(_marginSize),
            leading: Text('${scorer.position}位'),
            title: Text(scorer.player.name),
            subtitle: Text(scorer.teamName),
            trailing: Text('${scorer.goalCount}Goals'),
            onTap: () => _onTapListTile(context, scorer),
          ),
        );
      },
    ),
  );

  static const double _marginSize = 10;

  static void _onTapListTile(BuildContext context, Scorer scorer) =>
      SnackBarInformationMixin.showSnackBar(context, scorer.player.toMap());
}

