import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/repository/i_favorite_team_repository.dart';
import 'package:flutter/material.dart';

class FavoriteTeamViewModel extends ChangeNotifier {

  FavoriteTeamViewModel(this.favoriteTeamRepository);

  final IFavoriteTeamRepository favoriteTeamRepository;

  List<FavoriteTeam> get all => favoriteTeamRepository.all;

  Future<void> init() =>
      favoriteTeamRepository.init();

  bool contains(FavoriteTeam favoriteTeam) =>
      favoriteTeamRepository.contains(favoriteTeam);

  bool save(FavoriteTeam favoriteTeam) {
    final isSuccess = favoriteTeamRepository.save(favoriteTeam);
    notifyListeners();

    return isSuccess;
  }

  bool remove(FavoriteTeam favoriteTeam) {
    final isSuccess = favoriteTeamRepository.remove(favoriteTeam);
    notifyListeners();

    return isSuccess;
  }

  void clear() {
    favoriteTeamRepository.clear();
    notifyListeners();
  }
}
