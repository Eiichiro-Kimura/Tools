import 'package:dazn_schedule/model/entity/program.dart';

abstract class IProgramsRepository {

  Future<List<Program>> fetch();
}