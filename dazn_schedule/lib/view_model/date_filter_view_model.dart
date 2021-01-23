import 'package:flutter/material.dart';

class DateFilterViewModel extends ChangeNotifier {

  DateFilterViewModel();

  DateTime _firstDate;
  DateTime _lastDate;

  DateTime get firstDate => _firstDate;
  DateTime get lastDate => _lastDate;

  set firstDate(DateTime value) {
    _firstDate = value;
    notifyListeners();
  }

  set lastDate(DateTime value) {
    _lastDate = value;
    notifyListeners();
  }

  void clear() {
    firstDate = null;
    lastDate = null;
  }
}
