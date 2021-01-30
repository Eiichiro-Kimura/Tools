import 'package:dazn_schedule/model/entity/team_standing.dart';
import 'package:dazn_schedule/model/repository/i_standings_repository.dart';
import 'package:flutter/material.dart';

class StandingsVM extends ValueNotifier<List<TeamStanding>> {

  StandingsVM(this._standingsRepository) : super(null);

  final IStandingsRepository _standingsRepository;

  Future<void> generate(String tournamentName) async =>
      value = await _standingsRepository.fetch(tournamentName);
}
