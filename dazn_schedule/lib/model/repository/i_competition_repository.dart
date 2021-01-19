import 'package:dazn_schedule/model/team_standing.dart';

// ignore: one_member_abstracts
abstract class ICompetitionRepository {

  Future<List<TeamStanding>> getStandings(String tournamentName);
}