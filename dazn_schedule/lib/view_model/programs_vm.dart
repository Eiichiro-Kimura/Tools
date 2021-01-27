import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/model/program_filter.dart';
import 'package:dazn_schedule/model/repository/i_programs_repository.dart';
import 'package:flutter/material.dart';

class ProgramsVM extends ValueNotifier<List<Program>> {

  ProgramsVM(this._programsRepository) : super(null);

  final IProgramsRepository _programsRepository;
  ProgramFilter _programFilter;

  ProgramFilter get programFilter => _programFilter;

  Future<void> generate() async {
    // 番組表を生成
    value = await _programsRepository.fetch();

    // 番組フィルターを作成
    _programFilter = ProgramFilter(value);
  }
}
