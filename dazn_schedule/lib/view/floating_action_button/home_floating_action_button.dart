import 'package:dazn_schedule/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/helper/manager/page_manager.dart';
import 'package:dazn_schedule/view/part/icon_rotation_part.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/programs_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeFloatingActionButton extends FloatingActionButton {

  HomeFloatingActionButton(BuildContext context, VoidCallback callback) : super(
    onPressed: () => _onPressedSettings(context, callback),
    child: IconRotationPart(
        Icons.settings,
        context.watch<CtrlHomeVM>().settingsAnimation
    ),
  );

  static void _onPressedSettings(BuildContext context, VoidCallback callback) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();
    final programsVM = context.read<ProgramsVM>();

    ctrlHomeVM
        .settingsAnimation
        .forwardReset(() {
          PageManager()
              .forward(context, PageKind.settings, programsVM.programFilter)
              .then((_) => callback());
        });
  }
}
