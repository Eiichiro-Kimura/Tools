import 'package:dazn_schedule/model/entity/system_info.dart';
import 'package:dazn_schedule/model/repository/i_system_info_repository.dart';

class SystemInfoVM {

  SystemInfoVM(this._systemInfoRepository);

  final ISystemInfoRepository _systemInfoRepository;

  Future<void> init() => _systemInfoRepository.init();
  SystemInfo fetch() => _systemInfoRepository.fetch();
}
