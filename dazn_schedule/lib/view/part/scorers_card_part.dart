import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:dazn_schedule/view/helper/notice/snack_bar_notice.dart';
import 'package:dazn_schedule/view/part/map_information_part.dart';
import 'package:flutter/material.dart';

class ScorersCardPart extends Card {

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
      SnackBarNotice.showWithContent(
          context,
          MapInformationPart(context, scorer.player.toMap()),
          const Duration(minutes: 1)
      );
}

