import 'package:dazn_schedule/model/entity/program_filter.dart';
import 'package:intl/intl.dart';

class Program {

  const Program(this.date, this.time, this.genre, this.tournamentName,
      this.programName, this.commentaryName, this.homeTeamName,
      this.awayTeamName);

  final String date;
  final String time;
  final String genre;
  final String tournamentName;
  final String programName;
  final String commentaryName;
  final String homeTeamName;
  final String awayTeamName;

  DateTime get dateTime {
    const year = '2021';
    final month = _getNumberMonthDay(date.split('月')[0]);
    final day = _getNumberMonthDay(date.split('日')[0].split('月')[1]);

    return DateTime.parse('$year-$month-$day $time:00');
  }

  bool get haveTeamName => null != homeTeamName && null != awayTeamName;

  bool contains(String keyword, DateTime selectedFirstDate,
      DateTime selectedLastDate, String selectedGenre,
      String selectedTournamentName) {

    final isHitKeyword = date.contains(keyword) ||
        time.contains(keyword) ||
        genre.contains(keyword) ||
        tournamentName.contains(keyword) ||
        programName.contains(keyword) ||
        commentaryName.contains(keyword);
    final isValidDate = _isValidDate(
        selectedFirstDate,
        selectedLastDate
    );
    final isSelectedGenre = _isSelectedSettings(
        selectedGenre,
        genre
    );
    final isSelectedTournamentName = _isSelectedSettings(
        selectedTournamentName,
        tournamentName
    );

    return isHitKeyword &&
        isValidDate &&
        isSelectedGenre &&
        isSelectedTournamentName;
  }

  String _getNumberMonthDay(String text) =>
      NumberFormat('00').format(int.parse(text));

  bool _isSelectedSettings(String settingsName, String programName) =>
      settingsName.isEmpty || settingsName == ProgramFilter.allFilterName ||
      settingsName == programName;

  bool _isValidDate(DateTime firstDate, DateTime lastDate) {
    bool isValidDate;

    if (null == firstDate || null == lastDate) {
      isValidDate = true;
    } else {
      isValidDate = firstDate.isBefore(dateTime) && lastDate.isAfter(dateTime);
    }

    return isValidDate;
  }
}