import 'package:dazn_schedule/program_guide/program.dart';
import 'package:dazn_schedule/program_guide/program_filter.dart';
import 'package:universal_html/driver.dart' as driver;
// ignore: implementation_imports
import 'package:universal_html/src/html_with_internals.dart' as html_internals;

class ProgramGuide {

  static const url = 'https://flyingsc.github.io/dazn-schedule/';
  final _programs = <Program>[];

  ProgramFilter get programFilter {
    final programFilter = ProgramFilter();
    _programs.forEach(programFilter.add);

    return programFilter;
  }

  Future<List<Program>> generate() async {
    // 一度取得済み情報をクリア
    _programs.clear();

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
      programRow = _parseProgramRow(date, programRow.nextElementSibling);
    }

    return _programs;
  }

  html_internals.Element _parseProgramRow(String date,
      html_internals.Element programRow) {

    var programRowUse = programRow;

    while (null != programRowUse && 'date-row' != programRowUse.className) {
      _programs.add(
        Program(
          date,
          programRowUse.querySelector('.date').text,
          programRowUse.querySelector('.genre').text,
          programRowUse.querySelector('.tournament').text,
          programRowUse.querySelector('.tournament').nextElementSibling.text,
          programRowUse.querySelector('.tournament').nextElementSibling
              .nextElementSibling.text,
        )
      );

      programRowUse = programRowUse.nextElementSibling;
    }

    return programRowUse;
  }
}