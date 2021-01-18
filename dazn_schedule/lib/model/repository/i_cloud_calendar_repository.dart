import 'package:dazn_schedule/model/program.dart';

abstract class ICloudCalendarRepository {

  void init(String apiClientId);
  void add(Program program);
}
