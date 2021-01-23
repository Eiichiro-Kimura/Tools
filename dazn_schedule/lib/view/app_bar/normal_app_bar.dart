import 'package:dazn_schedule/view/app_bar/base_app_bar.dart';
import 'package:dazn_schedule/view/part/scale_icon_part.dart';
import 'package:dazn_schedule/view_model/date_filter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NormalAppBar extends BaseAppBar {

  NormalAppBar(String title, TextEditingController textEditingController,
      AnimationController leadingAnimationController,
      AnimationController trashAnimationController) : super(
    title,
    leadingAnimationController,
    (context) => Scaffold.of(context).openDrawer(),
    actions: [
      Padding(
        padding: const EdgeInsets.all(marginSize),
        child: Row(
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: ScaleIconPart(Icons.delete, trashAnimationController),
                  onPressed: () => _onPressedTrash(
                      context,
                      textEditingController,
                      trashAnimationController
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ],
  );

  static const double marginSize = 8;

  static void _onPressedTrash(BuildContext context,
      TextEditingController textEditingController,
      AnimationController animationController) =>
      animationController
          .forward()
          .then(
              (_) => _onPressedTrashEnd(
                  context,
                  textEditingController,
                  animationController
              )
          );

  static void _onPressedTrashEnd(BuildContext context,
      TextEditingController textEditingController,
      AnimationController animationController) {

    animationController.reverse();

    textEditingController.text = '';
    context.read<DateFilterViewModel>().clear();
  }
}
