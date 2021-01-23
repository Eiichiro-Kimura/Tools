import 'package:date_range_picker/date_range_picker.dart' as date_rage_picker;
import 'package:dazn_schedule/extensions/date_time.dart';
import 'package:dazn_schedule/view/part/rotation_icon_part.dart';
import 'package:dazn_schedule/view/part/scale_icon_part.dart';
import 'package:dazn_schedule/view_model/date_filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchComponent extends Container {

  SearchComponent(BuildContext context, TextEditingController textController,
      AnimationController cancelAnimationController,
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
                      cancelAnimationController
                  ),
                  onPressed: () => _onPressedCancel(
                      context,
                      textController,
                      cancelAnimationController
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

  static void _onPressedCancel(BuildContext context,
      TextEditingController textController,
      AnimationController animationController) =>
      animationController
          .forward()
          .then(
              (_) => _onPressedCancelEnd(textController, animationController)
          );

  static void _onPressedCancelEnd(TextEditingController textController,
      AnimationController animationController) {

    textController.clear();
    animationController.reset();
  }

  static void _onPressedCalendar(BuildContext context,
      AnimationController animationController) {

    animationController
        .forward()
        .then((_) => _onPressedCalendarEnd(context, animationController));
  }

  static Future<void> _onPressedCalendarEnd(BuildContext context,
      AnimationController animationController) async {

    animationController.reverse();

    final dateFilterViewModel = context.read<DateFilterViewModel>();
    final now = DateTime.now();
    final initialFirstDate = (dateFilterViewModel.firstDate ?? now)
      ..copyFirstTime();
    final initialLastDate = (dateFilterViewModel.lastDate ?? now)
      ..copyFirstTime();
    final firstDate = now.subtract(const Duration(days: 1));
    final lastDate = now.add(const Duration(days: 30));

    final selectedDates = await date_rage_picker.showDatePicker(
      context: context,
      locale: const Locale('ja'),
      initialFirstDate: initialFirstDate,
      initialLastDate: initialLastDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (null != selectedDates) {
      dateFilterViewModel
        ..firstDate = selectedDates[0].copyFirstTime()
        ..lastDate = selectedDates[selectedDates.length - 1].copyLastTime();
    }
  }
}
