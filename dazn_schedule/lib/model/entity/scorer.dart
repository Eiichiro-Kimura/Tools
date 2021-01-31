import 'package:dazn_schedule/model/entity/player.dart';

class Scorer {

  Scorer(this.player, this.teamName, this.position, this.goalCount);

  final Player player;
  final String teamName;
  final String position;
  final String goalCount;
}
