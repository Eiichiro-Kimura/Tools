import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/repository/i_favorite_teams_repository.dart';
import 'package:flutter/material.dart';

class FavoriteTeamsVM extends ChangeNotifier {

  FavoriteTeamsVM(this._favoriteTeamsRepository);

  final IFavoriteTeamsRepository _favoriteTeamsRepository;

  List<FavoriteTeam> get all => _favoriteTeamsRepository.all;

  Future<void> init() =>
      _favoriteTeamsRepository.init();

  bool contains(FavoriteTeam favoriteTeam) =>
      _favoriteTeamsRepository.contains(favoriteTeam);

  bool save(FavoriteTeam favoriteTeam) {
    final isSuccess = _favoriteTeamsRepository.store(favoriteTeam);
    notifyListeners();

    return isSuccess;
  }

  bool remove(FavoriteTeam favoriteTeam) {
    final isSuccess = _favoriteTeamsRepository.remove(favoriteTeam);
    notifyListeners();

    return isSuccess;
  }

  void clear() {
    _favoriteTeamsRepository.clear();
    notifyListeners();
  }
}
