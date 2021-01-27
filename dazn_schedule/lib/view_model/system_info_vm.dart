import 'package:dazn_schedule/model/repository/i_system_info_repository.dart';

class SystemInfoVM {

  SystemInfoVM(this._systemInfoRepository);

  final ISystemInfoRepository _systemInfoRepository;

  String get appName => _systemInfoRepository.appName;
  String get packageName => _systemInfoRepository.packageName;
  String get version => _systemInfoRepository.version;
  String get buildNumber => _systemInfoRepository.buildNumber;

  Future<void> init() => _systemInfoRepository.init();
}
