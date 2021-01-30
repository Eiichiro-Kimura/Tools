import 'package:dazn_schedule/common/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';
import 'package:dazn_schedule/view/helper/manager/tab_manager.dart';
import 'package:dazn_schedule/view/part/icon_scale_part.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/programs_filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalAppBar extends BaseAppBar {

  NormalAppBar(BuildContext context, GlobalKey<ScaffoldState> scaffoldKey,
      String title) : super(
    title,
    AnimatedIcons.menu_arrow,
    null,
    TabManager().createTabBar(scaffoldKey),
    (contextCB) => Scaffold.of(contextCB).openDrawer(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(_marginSize),
        child: Row(
          children: [
            IconButton(
              icon: IconScalePart(
                  context.watch<ProgramsFilterVM>().isFavoriteOnly ?
                    Icons.favorite : Icons.favorite_border,
                  context.watch<CtrlHomeVM>().favoriteFilterAnimation
              ),
              onPressed: () => _onPressedFavoriteFilter(context),
            ),
            IconButton(
              icon: IconScalePart(
                  Icons.delete,
                  context.watch<CtrlHomeVM>().clearFilterAnimation
              ),
              onPressed: () => _onPressedClearFilter(context),
            ),
          ],
        ),
      ),
    ],
  );

  static const double _marginSize = 8;

  static void _onPressedFavoriteFilter(BuildContext context) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();
    final programsFilterVM = context.read<ProgramsFilterVM>();

    ctrlHomeVM
        .favoriteFilterAnimation
        .forwardReverse(programsFilterVM.flipFavoriteOnly);
  }

  static void _onPressedClearFilter(BuildContext context) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();
    final programsFilterVM = context.read<ProgramsFilterVM>();

    ctrlHomeVM
        .clearFilterAnimation
        .forwardReverse(() {
          ctrlHomeVM.searchText.text = '';
          programsFilterVM.clear();
        });
  }
}
