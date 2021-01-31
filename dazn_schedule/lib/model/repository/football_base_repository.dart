import 'package:dazn_schedule/model/io/web_api_executor.dart';

class FootballBaseRepository {

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

  Map<String, String> get _headers => {'X-Auth-Token': _apiToken};

  String _getUrl(String tournamentName, String resourceName) =>
      '$_baseUrl/${_competitionIdMap[tournamentName]}/$resourceName';

  Future<WebApiResponse> callGetWebApi(String tournamentName,
      String resourceName) =>
      WebApiExecutor.get(
          WebApiGetRequest(_getUrl(tournamentName, resourceName), _headers)
      );
}
