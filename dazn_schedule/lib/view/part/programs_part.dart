import 'package:dazn_schedule/model/favorite_team.dart';
import 'package:dazn_schedule/model/program.dart';
import 'package:dazn_schedule/view/part/programs_card_part.dart';
import 'package:dazn_schedule/view_model/date_filter_view_model.dart';
import 'package:dazn_schedule/view_model/favorite_team_view_model.dart';
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
    final programs = context
        .watch<ProgramsViewModel>()
        .value;
    final settingsViewModel = context.watch<SettingsViewModel>();
    final dateFilterViewModel = context.watch<DateFilterViewModel>();
    final favoriteTeamViewModel = context.watch<FavoriteTeamViewModel>();
    final genre = settingsViewModel
        .getSetting(SettingsKind.filterGenre)
        .value;
    final tournamentName = settingsViewModel
        .getSetting(SettingsKind.filterTournamentName)
        .value;

    if (null != programs) {
      for (final program in programs) {
        if (dateFilterViewModel.isFavoriteOnly &&
            !_isFavorite(program, favoriteTeamViewModel)) {
          continue;
        }

        final isContains = program.contains(
            keyword,
            dateFilterViewModel.firstDate,
            dateFilterViewModel.lastDate,
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
      FavoriteTeamViewModel favoriteTeamViewModel) {

    final favoriteTeamHome = FavoriteTeam()
      ..genre = program.genre
      ..teamName = program.homeTeamName;
    final favoriteTeamAway = FavoriteTeam()
      ..genre = program.genre
      ..teamName = program.awayTeamName;

    return favoriteTeamViewModel.contains(favoriteTeamHome) ||
        favoriteTeamViewModel.contains(favoriteTeamAway);
  }
}
