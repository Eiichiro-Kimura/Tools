import 'package:dazn_schedule/model/entity/team_standing.dart';

abstract class ICompetitionRepository {

  Future<List<TeamStanding>> fetch(String tournamentName);
}
