import 'package:dazn_schedule/model/entity/program.dart';

abstract class ICloudCalendarRepository {

  void init(String apiClientId);
  void addEvent(Program program);
}
