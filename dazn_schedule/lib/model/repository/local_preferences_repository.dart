import 'package:dazn_schedule/model/io/preferences_provider.dart';
import 'package:dazn_schedule/model/repository/i_preferences_repository.dart';

class LocalPreferencesRepository implements IPreferencesRepository {

  final _preferencesProvider = PreferencesProvider();

  @override
  bool get isValid => _preferencesProvider.isValid;

  @override
  Future<void> init() async =>
      _preferencesProvider.init();

  @override
  String fetchStringValue(String key) =>
      _preferencesProvider.getString(key);

  @override
  Future<bool> storeStringValue(String key, String value) =>
      _preferencesProvider.setString(key, value);
}
