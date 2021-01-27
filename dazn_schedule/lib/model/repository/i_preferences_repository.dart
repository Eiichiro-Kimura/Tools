abstract class IPreferencesRepository {

  bool get isValid;

  Future<void> init();
  String fetchStringValue(String key);
  Future<bool> storeStringValue(String key, String value);
}
