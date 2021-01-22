import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/model/repository/i_programs_repository.dart';
import 'package:flutter/material.dart';

class ProgramsViewModel extends ValueNotifier<List<Program>> {

  ProgramsViewModel(this.programsRepository) : super(null);

  final IProgramsRepository programsRepository;
  ProgramFilter _programFilter;

  ProgramFilter get programFilter => _programFilter;

  Future<void> generate() async {
    // 番組表を生成
    value = await programsRepository.createPrograms();

    // 番組フィルターを作成
    _programFilter = ProgramFilter(value);
  }
}
