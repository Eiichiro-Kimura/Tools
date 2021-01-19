import 'package:dazn_schedule/model/repository/i_competition_repository.dart';
import 'package:dazn_schedule/model/team_standing.dart';
import 'package:flutter/material.dart';

class StandingsViewModel extends ChangeNotifier {

  StandingsViewModel(this.competitionRepository);

  final ICompetitionRepository competitionRepository;
  List<TeamStanding> _teamStandings;
  List<TeamStanding> get teamStandings => _teamStandings;

  Future<void> generate(String tournamentName) async {
    if (null != _teamStandings) {
      _teamStandings.clear();
    }

    _teamStandings = await competitionRepository.getStandings(tournamentName);

    // リスナーに通達
    notifyListeners();
  }
}
