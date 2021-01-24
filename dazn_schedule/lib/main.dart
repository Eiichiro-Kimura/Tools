import 'package:dazn_schedule/model/io/hive_database.dart';
import 'package:dazn_schedule/view/root/app_root.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  await HiveDatabase().init();

  runApp(AppRoot());
}
