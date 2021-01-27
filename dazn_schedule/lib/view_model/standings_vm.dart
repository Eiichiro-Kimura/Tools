import 'package:dazn_schedule/model/entity/team_standing.dart';
import 'package:dazn_schedule/model/repository/i_competition_repository.dart';
import 'package:flutter/material.dart';

class StandingsVM extends ValueNotifier<List<TeamStanding>> {

  StandingsVM(this._competitionRepository) : super(null);

  final ICompetitionRepository _competitionRepository;

  Future<void> generate(String tournamentName) async =>
      value = await _competitionRepository.fetch(tournamentName);
}
