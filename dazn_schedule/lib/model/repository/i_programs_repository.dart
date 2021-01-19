import 'package:dazn_schedule/model/program.dart';

// ignore: one_member_abstracts
abstract class IProgramsRepository {

  Future<List<Program>> getPrograms();
}