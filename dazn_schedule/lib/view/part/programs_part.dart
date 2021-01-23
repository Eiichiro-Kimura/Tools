import 'package:dazn_schedule/view/part/programs_card_part.dart';
import 'package:dazn_schedule/view_model/date_filter_view_model.dart';
import 'package:dazn_schedule/view_model/programs_view_model.dart';
import 'package:dazn_schedule/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsPart extends SingleChildScrollView {

  ProgramsPart(BuildContext context, String keyword) : super(
      child: Column(
        children: _createWidgets(context, keyword),
      )
  );

  static List<Widget> _createWidgets(BuildContext context, String keyword) {
    final widgets = <Widget>[];
    final programs = context.watch<ProgramsViewModel>().value;
    final settingsViewModel = context.watch<SettingsViewModel>();
    final dateFilterViewModel = context.watch<DateFilterViewModel>();
    final firstDate = dateFilterViewModel.firstDate;
    final lastDate = dateFilterViewModel.lastDate;
    final genre = settingsViewModel
        .getSetting(SettingsKind.filterGenre)
        .value;
    final tournamentName = settingsViewModel
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    if (null != programs) {
      for (final program in programs) {
        final isContains = program.contains(
          keyword,
          firstDate,
          lastDate,
          genre,
          tournamentName
        );

        if (isContains) {
          widgets.add(ProgramsCardPart(context, program));
        }
      }
    }

    return widgets;
  }
}
