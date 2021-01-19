import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/model/repository/i_programs_repository.dart';
import 'package:flutter/material.dart';

class ProgramsViewModel extends ChangeNotifier {

  ProgramsViewModel(this.programsRepository);

  final IProgramsRepository programsRepository;
  ProgramFilter _programFilter;
  List<Program> _programs = [];

  List<Program> get programs => _programs;
  ProgramFilter get programFilter => _programFilter;

  Future<void> generate() async {
    // 番組表を取得
    _programs = await programsRepository.getPrograms();

    // 番組フィルターを作成
    _programFilter = ProgramFilter(_programs);

    // リスナーに通歌津
    notifyListeners();
  }
}