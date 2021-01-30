import 'package:dazn_schedule/view/part/scorers_card_part.dart';
import 'package:dazn_schedule/view_model/scorers_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScorersPart extends SingleChildScrollView {

  ScorersPart(BuildContext context) : super(
    child: Column(
      children: _createWidgets(context),
    ),
  );

  static List<Widget> _createWidgets(BuildContext context) {
    final scorers = context.watch<ScorersVM>().value;
    var position = 0;

    return null == scorers ? <Widget>[] : scorers
        .map((scorer) => ScorersCardPart(++position, scorer))
        .toList();
  }
}
