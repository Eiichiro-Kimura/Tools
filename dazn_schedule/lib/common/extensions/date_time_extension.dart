extension DateTimeExtension on DateTime {

  DateTime cloneToDayStart() =>
      clone(
          hour: 0,
          minute: 0,
          second: 0,
          millisecond: 0,
          microsecond: 0
      );

  DateTime cloneToDayEnd() =>
      clone(
          hour: 23,
          minute: 59,
          second: 59,
          millisecond: 999,
          microsecond: 999
      );

  DateTime clone({
    int year,
    int month,
    int day,
    int hour,
    int minute,
    int second,
    int millisecond,
    int microsecond}) =>
      DateTime(
        year ?? this.year,
        month ?? this.month,
        day ?? this.day,
        hour ?? this.hour,
        minute ?? this.minute,
        second ?? this.second,
        millisecond ?? this.millisecond,
        microsecond ?? this.microsecond,
      );
}
