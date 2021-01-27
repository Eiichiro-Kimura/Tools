import 'package:package_info/package_info.dart';

class SystemInfo {

  PackageInfo _packageInfo;

  String get appName => _packageInfo.appName;
  String get packageName => _packageInfo.packageName;
  String get version => _packageInfo.version;
  String get buildNumber => _packageInfo.buildNumber;

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }
}
