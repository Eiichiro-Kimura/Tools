class Program {

  const Program(this.date, this.time, this.genre, this.tournamentName,
      this.programName, this.commentaryName);

  final String date;
  final String time;
  final String genre;
  final String tournamentName;
  final String programName;
  final String commentaryName;

  bool contains(String word) {
    return date.contains(word) ||
        time.contains(word) ||
        genre.contains(word) ||
        tournamentName.contains(word) ||
        programName.contains(word) ||
        commentaryName.contains(word);
  }
}