import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/model/repository/i_cloud_calendar_repository.dart';
import 'package:flutter/material.dart';

class CloudCalendarViewModel extends ChangeNotifier {

  CloudCalendarViewModel(this.cloudCalendarRepository);

  final ICloudCalendarRepository cloudCalendarRepository;

  void init(String apiClientId) =>
      cloudCalendarRepository.init(apiClientId);

  void addEvent(Program program) =>
      cloudCalendarRepository.addEvent(program);
}
