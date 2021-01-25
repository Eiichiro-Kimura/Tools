import 'package:dazn_schedule/model/repository/i_competition_repository.dart';
import 'package:dazn_schedule/model/team_standing.dart';
import 'package:flutter/material.dart';

class StandingsViewModel extends ValueNotifier<List<TeamStanding>> {

  StandingsViewModel(this._competitionRepository) : super(null);

  final ICompetitionRepository _competitionRepository;

  Future<void> generate(String tournamentName) async {
    value = await _competitionRepository.getStandings(tournamentName);
  }
}
