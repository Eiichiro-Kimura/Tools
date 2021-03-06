import 'package:dazn_schedule/model/entity/program.dart';
import 'package:dazn_schedule/model/repository/i_programs_repository.dart';
import 'package:universal_html/driver.dart' as driver;
import 'package:universal_html/src/html_with_internals.dart' as html_internals;

class DaznProgramsRepository implements IProgramsRepository {

  static const url = 'https://flyingsc.github.io/dazn-schedule/';

  @override
  Future<List<Program>> fetch() async {
    final programs = <Program>[];

    // クライアントを取得
    final client = driver.HtmlDriver();

    // Webページを取得
    await client.setDocumentFromUri(Uri.parse(url));

    // 最初の日時行を取得
    var programRow = client.document.querySelector('.date-row');

    while (null != programRow) {
      // 日付を取得
      final date = programRow
          .text
          .replaceAll('（', '\n')
          .replaceAll('）', '');

      // 番組行をパース
      final parseResult = _parseProgramRow(date, programRow.nextElementSibling);

      // 次のループのための準備
      programRow = parseResult.programRow;
      programs.addAll(parseResult.programs);
    }

    return programs;
  }

  _ParseResult _parseProgramRow(String date,
      html_internals.Element programRow) {

    final programs = <Program>[];
    var programRowUse = programRow;

    while (null != programRowUse && 'date-row' != programRowUse.className) {
      final time = programRowUse
          .querySelector('.date')
          .text;
      final genre = programRowUse
          .querySelector('.genre')
          .text;
      final tournamentName = programRowUse
          .querySelector('.tournament')
          .text;
      final programName = programRowUse
          .querySelector('.tournament')
          .nextElementSibling
          .text;
      final commentaryName = programRowUse
          .querySelector('.tournament')
          .nextElementSibling
          .nextElementSibling
          .text;
      final teamNames = _parseTeamNames(programName);
      final homeTeamName = 2 == teamNames.length ? teamNames[0] : null;
      final awayTeamName = 2 == teamNames.length ? teamNames[1] : null;

      programs.add(
          Program(
              date,
              time,
              genre,
              tournamentName,
              programName,
              commentaryName,
              homeTeamName,
              awayTeamName
          )
      );

      programRowUse = programRowUse.nextElementSibling;
    }

    return _ParseResult(programs, programRowUse);
  }

  List<String> _parseTeamNames(String programName) =>
      programName.split(' : ')[0].split(' (')[0].split(' vs ');
}

class _ParseResult {

  _ParseResult(this.programs, this.programRow);

  final List<Program> programs;
  final html_internals.Element programRow;
}
