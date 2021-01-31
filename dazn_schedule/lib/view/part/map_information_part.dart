import 'package:flutter/material.dart';

class MapInformationPart extends Column {

  MapInformationPart(BuildContext context, Map<String, String> map) : super(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: map
        .entries
        .map((entry) => _createRow(context, entry.key, entry.value))
        .toList(),
  );

  static Widget _createRow(BuildContext context, String name, String value) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$name ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Text(
              value ?? 'Unknown',
              style: TextStyle(
                color: Theme.of(context).backgroundColor,
              ),
            ),
          ),
        ],
      );
}
