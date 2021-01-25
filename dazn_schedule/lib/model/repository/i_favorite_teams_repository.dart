import 'package:dazn_schedule/model/favorite_team.dart';

abstract class IFavoriteTeamsRepository {

  List<FavoriteTeam> get all;

  Future<void> init();
  bool contains(FavoriteTeam favoriteTeam);
  bool save(FavoriteTeam favoriteTeam);
  bool remove(FavoriteTeam favoriteTeam);
  void clear();
}
