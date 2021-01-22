import 'package:dazn_schedule/view/part/rotation_icon_part.dart';
import 'package:flutter/material.dart';

class SearchComponent extends Container {

  SearchComponent(BuildContext context, TextEditingController textController,
      AnimationController animationController) : super(
    color: Theme.of(context).primaryColor,
    child: Padding(
      padding: const EdgeInsets.all(marginSize),
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
            icon: RotationIconPart(Icons.cancel, animationController),
            onPressed: () => _onPressed(
                textController,
                animationController
            ),
          ),
        ),
      ),
    ),
  );

  static const double marginSize = 8;

  static void _onPressed(TextEditingController textController,
      AnimationController animationController) {

    animationController
        .forward()
        .then((_) {
          textController.clear();
          animationController.reset();
    });
  }
}
