import 'package:dazn_schedule/model/entity/team.dart';

abstract class ITeamsRepository {

  Future<Team> fetch(int teamId);
}
