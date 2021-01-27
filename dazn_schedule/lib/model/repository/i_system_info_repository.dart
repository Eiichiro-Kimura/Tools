import 'package:dazn_schedule/model/entity/system_info.dart';

abstract class ISystemInfoRepository {

  Future<void> init();
  SystemInfo fetch();
}
