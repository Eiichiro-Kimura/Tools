import 'package:dazn_schedule/model/program.dart';

class ProgramFilter {

  ProgramFilter(List<Program> programs):
        genres = _toFilterListGenres(programs),
        tournamentNames = _toFilterListTournamentName(programs);

  final List<String> genres;
  final List<String> tournamentNames;

  static List<String> _toFilterListGenres(List<Program> programs) =>
      _toFilterList(programs, (program) => program.genre);

  static List<String> _toFilterListTournamentName(List<Program> programs) =>
      _toFilterList(programs, (program) => program.tournamentName);

  static List<String> _toFilterList(List<Program> programs,
      String Function(Program) addFunction) {

    final filterList = <String>[];

    for (final program in programs) {
      filterList.add(addFunction(program));
    }

    return Set.of(filterList).toList();
  }
}