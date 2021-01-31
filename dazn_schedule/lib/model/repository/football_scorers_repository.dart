import 'package:dazn_schedule/model/entity/player.dart';
import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:dazn_schedule/model/repository/football_base_repository.dart';
import 'package:dazn_schedule/model/repository/i_scorers_repository.dart';

class FootballScorersRepository extends FootballBaseRepository
    implements IScorersRepository {

  @override
  Future<List<Scorer>> fetch(String tournamentName) async {
    final response = await fetchCompetition(tournamentName, 'scorers');
    if (!response.isSuccess) {
      return null;
    }

    final root = response.bodyObject as Map<String, dynamic>;
    final scorers = root['scorers'] as List<dynamic>;
    var position = 0;

    return scorers
        .map((dynamic element) => _createScorer(++position, element))
        .toList();
  }

  Scorer _createScorer(int position, dynamic element) {
    final player = element['player'] as Map<String, dynamic>;
    final team = element['team'] as Map<String, dynamic>;

    return Scorer(
        Player(
            player['name'] as String,
            player['dateOfBirth'] as String,
            player['countryOfBirth'] as String,
            player['nationality'] as String,
            player['position'] as String
        ),
        team['name'] as String,
        position.toString(),
        (element['numberOfGoals'] as int).toString()
    );
  }
}
