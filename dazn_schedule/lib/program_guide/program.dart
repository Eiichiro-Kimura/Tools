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

  bool contains(String keyword, String selectedGenre,
      String selectedTournamentName) {

    final isHitKeyword = date.contains(keyword) ||
        time.contains(keyword) ||
        genre.contains(keyword) ||
        tournamentName.contains(keyword) ||
        programName.contains(keyword) ||
        commentaryName.contains(keyword);
    final isSelected = selectedGenre == genre &&
        selectedTournamentName == tournamentName;

    return isHitKeyword && isSelected;
  }

  String _getNumberMonthDay(String text) =>
      NumberFormat('00').format(int.parse(text));
}