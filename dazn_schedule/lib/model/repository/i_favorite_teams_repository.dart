import 'package:dazn_schedule/model/entity/favorite_team.dart';

abstract class IFavoriteTeamsRepository {

  List<FavoriteTeam> get all;

  Future<void> init();
  bool contains(FavoriteTeam favoriteTeam);
  bool store(FavoriteTeam favoriteTeam);
  bool remove(FavoriteTeam favoriteTeam);
  void clear();
}
