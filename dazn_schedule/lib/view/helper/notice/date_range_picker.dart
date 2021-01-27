import 'package:date_range_picker/date_range_picker.dart' as date_range_picker;
import 'package:dazn_schedule/view/helper/manager/locale_manager.dart';
import 'package:flutter/material.dart';

class DateRangePicker {

  static Future<List<DateTime>> show(BuildContext context,
      DateTime initialFirstDate, DateTime initialLastDate, DateTime firstDate,
      DateTime lastDate) async =>
      date_range_picker.showDatePicker(
          context: context,
          locale: LocaleManager().getLocale(LocaleKind.ja),
          initialFirstDate: initialFirstDate,
          initialLastDate: initialLastDate,
          firstDate: firstDate,
          lastDate: lastDate
      );
}
