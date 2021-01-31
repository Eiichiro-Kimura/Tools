import 'package:dazn_schedule/model/entity/team.dart';
import 'package:dazn_schedule/model/repository/i_teams_repository.dart';
import 'package:flutter/material.dart';

class TeamsVM extends ValueNotifier<Team> {

  TeamsVM(this._teamsRepository) : super(null);

  final ITeamsRepository _teamsRepository;

  Future<Team> fetch(int teamId) async =>
      value = await _teamsRepository.fetch(teamId);
}
