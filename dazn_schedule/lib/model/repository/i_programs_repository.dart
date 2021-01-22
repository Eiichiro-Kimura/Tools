import 'package:dazn_schedule/model/program.dart';

abstract class IProgramsRepository {

  Future<List<Program>> getPrograms();
}