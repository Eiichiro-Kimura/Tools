import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {

  factory HiveDatabase() => _instance;
  HiveDatabase._internal();

  static final HiveDatabase _instance = HiveDatabase._internal();

  Future<void> init() async {
    await Hive.initFlutter();

    Hive.registerAdapter(FavoriteTeamAdapter());
  }

  Future<Box<T>> open<T>() async => Hive.openBox<T>(T.toString());
}
