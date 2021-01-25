import 'package:dazn_schedule/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';
import 'package:dazn_schedule/view/part/icon_scale_part.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/programs_filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalAppBar extends BaseAppBar {

  NormalAppBar(BuildContext context, String title) : super(
    title,
    AnimatedIcons.menu_arrow,
    context.watch<CtrlHomeVM>().menuAnimation,
    (context) => Scaffold.of(context).openDrawer(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(marginSize),
        child: Row(
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: IconScalePart(
                      context.watch<ProgramsFilterVM>().isFavoriteOnly ?
                        Icons.favorite : Icons.favorite_border,
                      context.watch<CtrlHomeVM>().favoriteAnimation
                  ),
                  onPressed: () => _onPressedFavorite(context),
                );
              },
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  icon: IconScalePart(
                      Icons.delete,
                      context.watch<CtrlHomeVM>().trashAnimation
                  ),
                  onPressed: () => _onPressedTrash(context),
                );
              },
            ),
          ],
        ),
      ),
    ],
  );

  static const double marginSize = 8;

  static void _onPressedFavorite(BuildContext context) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();
    final programsFilterVM = context.read<ProgramsFilterVM>();

    ctrlHomeVM
        .favoriteAnimation
        .forwardReverse(programsFilterVM.flipFavoriteOnly);
  }

  static void _onPressedTrash(BuildContext context) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();
    final programsFilterVM = context.read<ProgramsFilterVM>();

    ctrlHomeVM
        .trashAnimation
        .forwardReverse(() {
          ctrlHomeVM.searchText.text = '';
          programsFilterVM.clear();
        });
  }
}
