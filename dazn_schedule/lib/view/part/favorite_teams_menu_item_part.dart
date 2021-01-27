import 'package:flutter/material.dart';

class FavoriteTeamsMenuItemPart extends PopupMenuItem<String> {

  FavoriteTeamsMenuItemPart(BuildContext context, String value,
      {@required bool isSelected}) : super(
    value: value,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: marginSize),
          child: Icon(
            isSelected ? Icons.favorite : Icons.favorite_border,
            color: Theme.of(context).accentColor,
          ),
        ),
        Text(value),
      ],
    ),
  );

  static const double marginSize = 10;
}