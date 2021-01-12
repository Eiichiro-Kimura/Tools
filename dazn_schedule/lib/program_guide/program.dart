import 'package:intl/intl.dart';

class Program {

  const Program(this.date, this.time, this.genre, this.tournamentName,
      this.programName, this.commentaryName);

  final String date;
  final String time;
  final String genre;
  final String tournamentName;
  final String programName;
  final String commentaryName;

  DateTime get dateTime {
    const year = '2021';
    final month = _getNumberMonthDay(date.split('月')[0]);
    final day = _getNumberMonthDay(date.split('日')[0].split('月')[1]);

    return DateTime.parse('$year-$month-$day $time:00');
  }

  bool contains(String word) {
    return date.contains(word) ||
        time.contains(word) ||
        genre.contains(word) ||
        tournamentName.contains(word) ||
        programName.contains(word) ||
        commentaryName.contains(word);
  }

  String _getNumberMonthDay(String text) {
    return NumberFormat('00').format(int.parse(text));
  }
}