import 'package:dazn_schedule/model/team_standing.dart';

abstract class ICompetitionRepository {

  Future<List<TeamStanding>> getStandings(String tournamentName);
}
