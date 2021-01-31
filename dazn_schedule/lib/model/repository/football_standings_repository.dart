import 'package:dazn_schedule/model/entity/team_standing.dart';
import 'package:dazn_schedule/model/repository/football_base_repository.dart';
import 'package:dazn_schedule/model/repository/i_standings_repository.dart';

class FootballStandingsRepository extends FootballBaseRepository
    implements IStandingsRepository {

  @override
  Future<List<TeamStanding>> fetch(String tournamentName) async {
    final response = await fetchCompetition(tournamentName, 'standings');
    if (!response.isSuccess) {
      return null;
    }

    final root = response.bodyObject as Map<String, dynamic>;
    final total = root['standings'][0] as Map<String, dynamic>;
    final table = total['table'] as List<dynamic>;

    return table.map(_createTeamStanding).toList();
  }

  TeamStanding _createTeamStanding(dynamic element) {
    final teamResult = element as Map<String, dynamic>;
    final teamDetail = teamResult['team'] as Map<String, dynamic>;

    return TeamStanding(
      teamDetail['id'] as int,
      teamDetail['name'] as String,
      _toStringFromInt(teamResult['position']),
      _toStringFromInt(teamResult['won']),
      _toStringFromInt(teamResult['draw']),
      _toStringFromInt(teamResult['lost']),
      _toStringFromInt(teamResult['points']),
    );
  }

  String _toStringFromInt(dynamic value) => (value as int).toString();
}
