import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabaseOpener {

  factory HiveDatabaseOpener() => _instance;
  HiveDatabaseOpener._internal();

  static final HiveDatabaseOpener _instance = HiveDatabaseOpener._internal();

  Future<void> init() => Hive.initFlutter();

  Future<HiveBox<T>> open<T>() async =>
      HiveBox(await Hive.openBox<T>(T.toString()));

  void addAdapter<T>(TypeAdapter<T> adapter) => Hive.registerAdapter(adapter);
}

class HiveBox<T> {

  HiveBox(this._box);

  final Box<T> _box;

  bool get isOpen => _box.isOpen;
  Iterable<T> get values => _box.values;
  Future<int> add(T value) => _box.add(value);
  Future<void> delete(dynamic key) => _box.delete(key);
  Future<int> clear() => _box.clear();
}
