import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favorite_team.g.dart';

@HiveType(typeId: 0)
class FavoriteTeam extends HiveObject with EquatableMixin {

  FavoriteTeam();

  FavoriteTeam.withData(this.genre, this.teamName);

  @HiveField(0)
  String genre;

  @HiveField(1)
  String teamName;

  @override
  List<Object> get props => [genre, teamName];
}
