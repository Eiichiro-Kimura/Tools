import 'package:dazn_schedule/model/entity/scorer.dart';

abstract class IScorersRepository {

  Future<List<Scorer>> fetch(String tournamentName);
}
