import 'package:dazn_schedule/model/entity/system_info.dart';
import 'package:dazn_schedule/model/io/system_info_provider.dart';
import 'package:dazn_schedule/model/repository/i_system_info_repository.dart';

class SystemInfoRepository implements ISystemInfoRepository {

  final _systemInfoProvider = SystemInfoProvider();

  @override
  Future<void> init() => _systemInfoProvider.init();

  @override
  SystemInfo fetch() => _systemInfoProvider.fetch();
}
