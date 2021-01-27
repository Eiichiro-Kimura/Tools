import 'package:dazn_schedule/model/entity/favorite_team.dart';
import 'package:dazn_schedule/model/io/hive_database_opener.dart';
import 'package:dazn_schedule/view/root/app_root.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final hiveDatabaseOpener = HiveDatabaseOpener()
    ..addAdapter(FavoriteTeamAdapter());
  await hiveDatabaseOpener.init();

  runApp(const AppRoot());
}
