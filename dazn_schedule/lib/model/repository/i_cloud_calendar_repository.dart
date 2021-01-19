import 'package:dazn_schedule/model/program.dart';

abstract class ICloudCalendarRepository {

  void init(String apiClientId);
  void addEvent(Program program);
}
