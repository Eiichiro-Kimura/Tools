import 'package:dazn_schedule/model/entity/team_standing.dart';

abstract class IStandingsRepository {

  Future<List<TeamStanding>> fetch(String tournamentName);
}
