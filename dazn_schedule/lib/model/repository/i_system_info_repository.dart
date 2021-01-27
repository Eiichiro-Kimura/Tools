abstract class ISystemInfoRepository {

  String get appName;
  String get packageName;
  String get version;
  String get buildNumber;

  Future<void> init();
}
