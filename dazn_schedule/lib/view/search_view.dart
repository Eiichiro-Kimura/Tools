import 'package:flutter/material.dart';

class SearchView extends Container {

  SearchView(BuildContext context, TextEditingController controller,
      ValueChanged<String> valueChanged): super(
    color: Theme.of(context).primaryColor,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: ListTile(
          leading: const Icon(Icons.search),
          title: TextField(
            controller: controller,
            decoration: const InputDecoration(
                hintText: 'Search',
                border: InputBorder.none
            ),
            onChanged: valueChanged,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              valueChanged('');
            },
          ),
        ),
      ),
    ),
  );
}
