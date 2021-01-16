
import 'package:dazn_schedule/program_guide/program.dart';

class ProgramFilter {

  List<String> _genres = [];
  List<String> _tournamentNames = [];

  List<String> get genres => _genres;
  List<String> get tournamentNames => _tournamentNames;

  void add(Program program) {
    _genres = Set
        .of(_genres..add(program.genre))
        .toList();
    _tournamentNames = Set
        .of(_tournamentNames..add(program.tournamentName))
        .toList();
  }
}