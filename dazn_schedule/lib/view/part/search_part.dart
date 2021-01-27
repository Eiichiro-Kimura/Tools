import 'package:dazn_schedule/common/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/helper/notice/date_range_picker.dart';
import 'package:dazn_schedule/view/part/icon_rotation_part.dart';
import 'package:dazn_schedule/view/part/icon_scale_part.dart';
import 'package:dazn_schedule/view_model/ctrl_home_vm.dart';
import 'package:dazn_schedule/view_model/programs_filter_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPart extends Container {

  SearchPart(BuildContext context) : super(
    color: Theme.of(context).primaryColor,
    child: Padding(
      padding: const EdgeInsets.all(marginSize),
      child: Row(
        children: [
          Expanded(
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.search),
                title: TextField(
                  controller: context.watch<CtrlHomeVM>().searchText,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
                trailing: IconButton(
                  icon: IconRotationPart(
                      Icons.cancel,
                      context.watch<CtrlHomeVM>().clearSearchTextAnimation
                  ),
                  onPressed: () => _onPressedClearSearchText(context),
                ),
              ),
            ),
          ),
          IconButton(
            icon: IconScalePart(
                Icons.calendar_today_outlined,
                context.watch<CtrlHomeVM>().calendarAnimation
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            onPressed: () => _onPressedCalendar(context),
          ),
        ],
      ),
    ),
  );

  static const double marginSize = 8;

  static void _onPressedClearSearchText(BuildContext context) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();

    ctrlHomeVM
        .clearSearchTextAnimation
        .forwardReset(ctrlHomeVM.searchText.clear);
  }

  static void _onPressedCalendar(BuildContext context) {
    final ctrlHomeVM = context.read<CtrlHomeVM>();
    final programsFilterVM = context.read<ProgramsFilterVM>();

    ctrlHomeVM
        .calendarAnimation
        .forwardReverse(() async {
          final now = DateTime.now();
          final selectedDates = await DateRangePicker.show(
              context,
              programsFilterVM.firstDayStart,
              programsFilterVM.lastDayStart,
              now.subtract(const Duration(days: 1)),
              now.add(const Duration(days: 30))
          );

          if (null != selectedDates) {
            programsFilterVM
              ..firstDate = selectedDates[0]
              ..lastDate = selectedDates[selectedDates.length - 1];
          }
        });
  }
}
