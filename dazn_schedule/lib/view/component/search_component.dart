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
            icon: RotationTransition(
              turns: Tween<double>(begin: tweenBegin, end: tweenEnd)
                  .animate(animeController),
              child: const Icon(Icons.cancel),
            ),
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
  static const double tweenBegin = 0;
  static const double tweenEnd = 0.3;

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
