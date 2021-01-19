import 'package:flutter/material.dart';

class SearchComponent extends Container {

  SearchComponent(BuildContext context, TextEditingController controller,
      VoidCallback callback) : super(
    color: Theme.of(context).primaryColor,
    child: Padding(
      padding: const EdgeInsets.all(marginSize),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: 'Search',
              border: InputBorder.none,
            ),
            onChanged: (_) => callback(),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              callback();
            },
          ),
        ),
      ),
    ),
  );

  static const double marginSize = 8;
}
