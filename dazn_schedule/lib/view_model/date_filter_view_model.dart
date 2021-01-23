import 'package:dazn_schedule/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';

class DateFilterViewModel extends ChangeNotifier {

  DateFilterViewModel();

  DateTime _firstDate;
  DateTime _lastDate;

  DateTime get firstDate => _firstDate;
  DateTime get lastDate => _lastDate;
  DateTime get firstDayStart =>
      (_firstDate ?? DateTime.now()).cloneToDayStart();
  DateTime get lastDayStart =>
      (_lastDate ?? DateTime.now()).cloneToDayStart();

  set firstDate(DateTime value) {
    _firstDate = value.cloneToDayStart();
    notifyListeners();
  }

  set lastDate(DateTime value) {
    _lastDate = value.cloneToDayEnd();
    notifyListeners();
  }

  void clear() {
    _firstDate = null;
    _lastDate = null;
    notifyListeners();
  }
}
