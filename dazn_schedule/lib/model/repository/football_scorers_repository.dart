import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:dazn_schedule/model/repository/football_base_repository.dart';
import 'package:dazn_schedule/model/repository/i_scorers_repository.dart';

class FootballScorersRepository extends FootballBaseRepository
    implements IScorersRepository {

  @override
  Future<List<Scorer>> fetch(String tournamentName) async {
    final response = await callGetWebApi(tournamentName, 'scorers');
    if (!response.isSuccess) {
      return null;
    }

    final root = response.bodyObject as Map<String, dynamic>;
    final scorers = root['scorers'] as List<dynamic>;

    return scorers.map(_createScorer).toList();
  }

  Scorer _createScorer(dynamic element) {
    final player = element['player'] as Map<String, dynamic>;
    final team = element['team'] as Map<String, dynamic>;

    return Scorer(
        player['name'] as String,
        team['name'] as String,
        (element['numberOfGoals'] as int).toString()
    );
  }
}
