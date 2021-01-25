import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/model/repository/i_cloud_calendar_repository.dart';

class CloudCalendarVM {

  CloudCalendarVM(this._cloudCalendarRepository);

  final ICloudCalendarRepository _cloudCalendarRepository;

  void init(String apiClientId) => _cloudCalendarRepository.init(apiClientId);

  void addEvent(Program program) => _cloudCalendarRepository.addEvent(program);
}
