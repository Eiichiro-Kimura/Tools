import 'package:dazn_schedule/extensions/date_time_extension.dart';
import 'package:flutter/material.dart';

class ProgramsFilterVM extends ChangeNotifier {

  DateTime _firstDate;
  DateTime _lastDate;
  bool _isFavoriteOnly = false;

  DateTime get firstDate => _firstDate;
  DateTime get lastDate => _lastDate;
  bool get isFavoriteOnly => _isFavoriteOnly;
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

  void flipFavoriteOnly() {
    _isFavoriteOnly = !_isFavoriteOnly;
    notifyListeners();
  }

  void clear() {
    _firstDate = null;
    _lastDate = null;
    _isFavoriteOnly = false;
    notifyListeners();
  }
}
