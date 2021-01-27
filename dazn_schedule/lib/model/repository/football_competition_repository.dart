import 'package:dazn_schedule/model/io/web_api.dart';
import 'package:dazn_schedule/model/repository/i_competition_repository.dart';
import 'package:dazn_schedule/model/team_standing.dart';

class FootballCompetitionRepository implements ICompetitionRepository {

  static const _baseUrl = 'http://api.football-data.org/v2/competitions';
  static const _apiToken = 'cce49f9cf8104f8da53c7e5bae7a3094';
  static const _competitionIdMap = {
    'プレミアリーグ': 2021,
    'リーグアン': 2015,
    'セリエA': 2019,
    'コパ・デル・レイ': 2014,
    'ラ・リーガ': 2014,
    'FAカップ': 2021,
    'コッパ・イタリア': 2019,
  };

  @override
  Future<List<TeamStanding>> getStandings(String tournamentName) async {
    final response = await WebApi.get(
      WebApiGetRequest(_getUrl(tournamentName), {'X-Auth-Token': _apiToken})
    );
    if (!response.isSuccess) {
      return null;
    }

    final root = response.bodyObject as Map<String, dynamic>;
    final total = root['standings'][0] as Map<String, dynamic>;
    final table = total['table'] as List<dynamic>;

    return table.map(_createTeamStanding).toList();
  }

  String _getUrl(String tournamentName) =>
      '$_baseUrl/${_competitionIdMap[tournamentName]}/standings';

  TeamStanding _createTeamStanding(dynamic element) {
    final teamResult = element as Map<String, dynamic>;
    final teamDetail = teamResult['team'] as Map<String, dynamic>;

    return TeamStanding(
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
