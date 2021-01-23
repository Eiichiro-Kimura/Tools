import 'package:dazn_schedule/extensions/animation_controller_extension.dart';
import 'package:dazn_schedule/view/helper/notice/date_range_picker.dart';
import 'package:dazn_schedule/view/part/rotation_icon_part.dart';
import 'package:dazn_schedule/view/part/scale_icon_part.dart';
import 'package:dazn_schedule/view_model/date_filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchComponent extends Container {

  SearchComponent(BuildContext context, TextEditingController textController,
      AnimationController clearAnimationController,
      AnimationController calendarAnimationController) : super(
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
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
                trailing: IconButton(
                  icon: RotationIconPart(
                      Icons.cancel,
                      clearAnimationController
                  ),
                  onPressed: () => _onPressedClear(
                      context,
                      textController,
                      clearAnimationController
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: ScaleIconPart(
                Icons.calendar_today_outlined,
                calendarAnimationController
            ),
            color: Theme.of(context).scaffoldBackgroundColor,
            onPressed: () => _onPressedCalendar(
                context,
                calendarAnimationController
            ),
          ),
        ],
      ),
    ),
  );

  static const double marginSize = 8;

  static void _onPressedClear(BuildContext context,
      TextEditingController textController,
      AnimationController animationController) =>
      animationController.forwardReset(textController.clear);

  static void _onPressedCalendar(BuildContext context,
      AnimationController animationController) =>
      animationController.forwardReverse(() async {
        final dateFilterViewModel = context.read<DateFilterViewModel>();
        final now = DateTime.now();
        final selectedDates = await DateRangePicker.show(
            context,
            dateFilterViewModel.firstDayStart,
            dateFilterViewModel.lastDayStart,
            now.subtract(const Duration(days: 1)),
            now.add(const Duration(days: 30))
        );

        if (null != selectedDates) {
          dateFilterViewModel
            ..firstDate = selectedDates[0]
            ..lastDate = selectedDates[selectedDates.length - 1];
        }
      });
}
