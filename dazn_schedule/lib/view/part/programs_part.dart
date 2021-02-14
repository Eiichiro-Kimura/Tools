import 'package:dazn_schedule/model/entity/favorite_team.dart';
import 'package:dazn_schedule/model/entity/program.dart';
import 'package:dazn_schedule/view/part/programs_card_part.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/programs_filter_vm.dart';
import 'package:dazn_schedule/view_model/favorite_teams_vm.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:dazn_schedule/view_model/settings_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgramsPart extends SingleChildScrollView {

  ProgramsPart(BuildContext context) : super(
      child: Column(
        children: _createWidgets(context),
      )
  );

  static List<Widget> _createWidgets(BuildContext context) {
    final ctrlHomeVM = context.watch<CtrlHomeVM>();
    final programsVM = context.watch<ProgramsVM>();
    final settingsVM = context.watch<SettingsVM>();
    final programsFilterVM = context.watch<ProgramsFilterVM>();
    final favoriteTeamsVM = context.watch<FavoriteTeamsVM>();

    final widgets = <Widget>[];
    final programs = programsVM.value;
    final genre = settingsVM
        .getSetting(SettingsKind.filterGenre)
        .value;
    final tournamentName = settingsVM
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    if (null != programs) {
      for (final program in programs) {
        if (programsFilterVM.isFavoriteOnly &&
            !_isFavorite(program, favoriteTeamsVM)) {
          continue;
        }

        final isContains = program.contains(
            ctrlHomeVM.searchText.text,
            programsFilterVM.firstDate,
            programsFilterVM.lastDate,
            genre,
            tournamentName
        );

        if (isContains) {
          widgets.add(ProgramsCardPart(program));
        }
      }
    }

    return widgets;
  }

  static bool _isFavorite(Program program, FavoriteTeamsVM favoriteTeamsVM) {
    final isFavoriteTeamHome = favoriteTeamsVM.contains(
        FavoriteTeam.withData(
            program.homeTeamName,
            program.genre,
            program.tournamentName
        )
    );
    final isFavoriteTeamAway = favoriteTeamsVM.contains(
        FavoriteTeam.withData(
            program.awayTeamName,
            program.genre,
            program.tournamentName
        )
    );

    return isFavoriteTeamHome || isFavoriteTeamAway;
  }
}
