import 'package:dazn_schedule/model/entity/system_info.dart';
import 'package:package_info/package_info.dart';

class SystemInfoProvider {

  PackageInfo _packageInfo;

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  SystemInfo fetch() => SystemInfo(
    _packageInfo.appName,
    _packageInfo.packageName,
    _packageInfo.version,
    _packageInfo.buildNumber
  );
}
