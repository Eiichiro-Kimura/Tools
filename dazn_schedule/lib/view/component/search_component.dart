import 'package:dazn_schedule/view/component/rotation_icon_component.dart';
import 'package:flutter/material.dart';

class SearchComponent extends Container {

  SearchComponent(BuildContext context, TextEditingController textController,
      AnimationController animationController, VoidCallback callback) : super(
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
            onChanged: (_) => callback(),
          ),
          trailing: IconButton(
            icon: RotationIconComponent(Icons.cancel, animationController),
            onPressed: () => _onPressed(
                textController,
                animationController,
                callback
            ),
          ),
        ),
      ),
    ),
  );

  static const double marginSize = 8;

  static void _onPressed(TextEditingController textController,
      AnimationController animationController, VoidCallback callback) {

    animationController
        .forward()
        .then((_) {
          textController.clear();
          animationController.reset();
          callback();
    });
  }
}
