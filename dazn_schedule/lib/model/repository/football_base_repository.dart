import 'package:dazn_schedule/model/io/web_api_executor.dart';

class FootballBaseRepository {

  static const _baseUrl = 'http://api.football-data.org/v2';
  static const _baseUrlCompetitions = '$_baseUrl/competitions';
  static const _baseUrlTeams = '$_baseUrl/teams';
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

  Map<String, String> get _headers => {'X-Auth-Token': _apiToken};

  String _getCompetitionsUrl(String tournamentName, String resourceName) =>
      '$_baseUrlCompetitions/${_competitionIdMap[tournamentName]}/$resourceName';

  String _getTramsUrl(int teamId) =>
      '$_baseUrlTeams/$teamId';

  Future<WebApiResponse> fetchCompetition(String tournamentName,
      String resourceName) =>
      WebApiExecutor.get(
          WebApiGetRequest(
              _getCompetitionsUrl(tournamentName, resourceName),
              _headers
          )
      );

  Future<WebApiResponse> fetchTeam(int teamId) =>
      WebApiExecutor.get(
          WebApiGetRequest(
              _getTramsUrl(teamId),
              _headers
          )
      );
}
