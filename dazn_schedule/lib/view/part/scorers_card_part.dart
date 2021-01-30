import 'package:dazn_schedule/model/entity/player.dart';
import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:dazn_schedule/view/helper/notice/snack_bar_notice.dart';
import 'package:flutter/material.dart';

class ScorersCardPart extends Card {

  ScorersCardPart(int position, Scorer scorer) : super(
    margin: const EdgeInsets.all(_marginSize),
    child: Builder(
      builder: (context) {
        return Container(
          child: ListTile(
            contentPadding: const EdgeInsets.all(_marginSize),
            leading: Text('$position位'),
            title: Text(scorer.player.name),
            subtitle: Text(scorer.teamName),
            trailing: Text('${scorer.goalCount}Goals'),
            onTap: () =>
                SnackBarNotice.showWithContent(
                    context,
                    _createSnackBarWidget(context, scorer.player),
                    const Duration(minutes: 1)
                ),
          ),
        );
      },
    ),
  );

  static const double _marginSize = 10;

  static Widget _createSnackBarWidget(BuildContext context, Player player) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _createSnackBarRowWidget(
              context,
              'Name',
              player.name
          ),
          _createSnackBarRowWidget(
              context,
              'DateOfBirth',
              player.dateOfBirth
          ),
          _createSnackBarRowWidget(
              context,
              'CountryOfBirth',
              player.countryOfBirth
          ),
          _createSnackBarRowWidget(
              context,
              'Nationality',
              player.nationality
          ),
          _createSnackBarRowWidget(
              context,
              'Position',
              player.position
          ),
        ],
      );

  static Widget _createSnackBarRowWidget(BuildContext context, String name,
      String value) =>
      Row(
        children: [
          Text(
            '$name ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ],
      );
}

