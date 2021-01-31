import 'package:dazn_schedule/model/entity/team.dart';
import 'package:dazn_schedule/model/repository/football_base_repository.dart';
import 'package:dazn_schedule/model/repository/i_teams_repository.dart';

class FootballTeamsRepository extends FootballBaseRepository
    implements ITeamsRepository {

  @override
  Future<Team> fetch(int teamId) async {
    final response = await fetchTeam(teamId);
    if (!response.isSuccess) {
      return null;
    }

    final root = response.bodyObject as Map<String, dynamic>;

    return Team(
      root['id'] as int,
      root['name'] as String,
      root['phone'] as String,
      root['website'] as String,
      root['email'] as String,
      root['clubColors'] as String,
      root['venue'] as String,
      root['address'] as String
    );
  }
}
