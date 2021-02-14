import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'favorite_team.g.dart';

@HiveType(typeId: 0)
class FavoriteTeam extends HiveObject with EquatableMixin {

  FavoriteTeam();

  FavoriteTeam.withData(this.teamName, this.genre, this.tournamentName);

  @HiveField(0)
  String teamName;

  @HiveField(1)
  String genre;

  @HiveField(2)
  String tournamentName;

  @override
  List<Object> get props => [teamName, genre, tournamentName];
}
