import 'package:dazn_schedule/model/entity/scorer.dart';
import 'package:dazn_schedule/model/repository/i_scorers_repository.dart';
import 'package:flutter/material.dart';

class ScorersVM extends ValueNotifier<List<Scorer>> {

  ScorersVM(this._scorersRepository) : super(null);

  final IScorersRepository _scorersRepository;

  Future<List<Scorer>> fetch(String tournamentName) async =>
      value = await _scorersRepository.fetch(tournamentName);
}
