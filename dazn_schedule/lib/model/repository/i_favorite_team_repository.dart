import 'package:dazn_schedule/model/favorite_team.dart';

abstract class IFavoriteTeamRepository {

  Future<void> init();
  bool contains(FavoriteTeam favoriteTeam);
  bool save(FavoriteTeam favoriteTeam);
  bool remove(FavoriteTeam favoriteTeam);
}
