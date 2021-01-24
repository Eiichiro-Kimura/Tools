import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/io/hive_database.dart';
import 'package:dazn_schedule/model/repository/i_favorite_team_repository.dart';
import 'package:hive/hive.dart';

class FavoriteTeamLocalRepository implements IFavoriteTeamRepository {

  Box<FavoriteTeam> _box;

  bool get _isValid => null != _box && _box.isOpen;

  @override
  List<FavoriteTeam> get all => _isValid ? _box.values.toList() : [];

  @override
  Future<void> init() async =>
      _box = await HiveDatabase().open<FavoriteTeam>();

  @override
  bool contains(FavoriteTeam favoriteTeam) =>
      _isValid && _box.values.contains(favoriteTeam);

  @override
  bool save(FavoriteTeam favoriteTeam) {
    if (_isValid) {
      if (!contains(favoriteTeam)) {
        _box.add(favoriteTeam);
      }

      return true;
    } else {
      return false;
    }
  }

  @override
  bool remove(FavoriteTeam favoriteTeam) {
    if (_isValid) {
      if (contains(favoriteTeam)) {
        final dynamic key = _box
            .values
            .singleWhere((element) => element == favoriteTeam)
            .key;

        _box.delete(key);
      }

      return true;
    } else {
      return false;
    }
  }

  @override
  void clear() {
    if (_isValid) {
      _box.clear();
    }
  }
}
