import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {

  factory HiveDatabase() => _instance;
  HiveDatabase._internal();

  static final HiveDatabase _instance = HiveDatabase._internal();

  Future<void> init() => Hive.initFlutter();

  Future<Box<T>> open<T>() => Hive.openBox<T>(T.toString());

  void addAdapter<T>(TypeAdapter<T> adapter) => Hive.registerAdapter(adapter);
}
