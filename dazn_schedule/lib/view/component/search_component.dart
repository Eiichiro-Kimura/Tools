import 'package:dazn_schedule/view/component/rotation_icon_component.dart';
import 'package:flutter/material.dart';

class SearchComponent extends Container {

  SearchComponent(BuildContext context, TextEditingController textController,
      AnimationController animeController, VoidCallback callback) : super(
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
            icon: RotationIconComponent(Icons.cancel, animeController),
            onPressed: () => _onPressed(
                textController,
                animeController,
                callback
            ),
          ),
        ),
      ),
    ),
  );

  static const double marginSize = 8;

  static void _onPressed(TextEditingController textController,
      AnimationController animeController, VoidCallback callback) {

    animeController
        .forward()
        .then((_) {
          textController.clear();
          animeController.reset();
          callback();
    });
  }
}
