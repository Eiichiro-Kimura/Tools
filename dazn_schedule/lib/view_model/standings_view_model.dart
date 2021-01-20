import 'package:dazn_schedule/model/repository/i_competition_repository.dart';
import 'package:dazn_schedule/model/team_standing.dart';
import 'package:flutter/material.dart';

class StandingsViewModel extends ValueNotifier<List<TeamStanding>> {

  StandingsViewModel(this.competitionRepository) : super(null);

  final ICompetitionRepository competitionRepository;

  Future<void> generate(String tournamentName) async {
    value = await competitionRepository.getStandings(tournamentName);
  }
}
