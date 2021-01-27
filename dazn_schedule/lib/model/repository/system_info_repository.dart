import 'package:dazn_schedule/model/io/system_info.dart';
import 'package:dazn_schedule/model/repository/i_system_info_repository.dart';

class SystemInfoRepository implements ISystemInfoRepository {

  final _systemInfo = SystemInfo();

  @override
  String get appName => _systemInfo.appName;

  @override
  String get buildNumber => _systemInfo.buildNumber;

  @override
  String get packageName => _systemInfo.packageName;

  @override
  String get version => _systemInfo.version;

  @override
  Future<void> init() => _systemInfo.init();
}
