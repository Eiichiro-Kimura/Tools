import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/view/part/programs_card_part.dart';
import 'package:dazn_schedule/view_model/programs_filter_view_model.dart';
import 'package:dazn_schedule/view_model/favorite_teams_view_model.dart';
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
    final programsFilterViewModel = context.watch<ProgramsFilterViewModel>();
    final favoriteTeamsViewModel = context.watch<FavoriteTeamsViewModel>();
    final genre = settingsViewModel
        .getSetting(SettingsKind.filterGenre)
        .value;
    final tournamentName = settingsViewModel
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    if (null != programs) {
      for (final program in programs) {
        if (programsFilterViewModel.isFavoriteOnly &&
            !_isFavorite(program, favoriteTeamsViewModel)) {
          continue;
        }

        final isContains = program.contains(
            keyword,
            programsFilterViewModel.firstDate,
            programsFilterViewModel.lastDate,
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

  static bool _isFavorite(Program program,
      FavoriteTeamsViewModel favoriteTeamsViewModel) {

    final favoriteTeamHome = FavoriteTeam()
      ..genre = program.genre
      ..teamName = program.homeTeamName;
    final favoriteTeamAway = FavoriteTeam()
      ..genre = program.genre
      ..teamName = program.awayTeamName;

    return favoriteTeamsViewModel.contains(favoriteTeamHome) ||
        favoriteTeamsViewModel.contains(favoriteTeamAway);
  }
}
