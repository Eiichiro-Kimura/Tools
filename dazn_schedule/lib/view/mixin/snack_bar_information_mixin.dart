import 'package:dazn_schedule/view/helper/notice/snack_bar_notice.dart';
import 'package:flutter/material.dart';

mixin SnackBarInformationMixin {

  static const Duration _duration = Duration(minutes: 1);

  static void showSnackBar(BuildContext context, Map<String, String> map) {
    SnackBarNotice.showWithContent(
        context,
        _createSnackBarContent(context, map),
        _duration
    );
  }

  static Widget _createSnackBarContent(BuildContext context,
      Map<String, String> map) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: map
            .entries
            .map((entry) =>
              _createSnackBarContentRow(
                  context,
                  entry.key,
                  entry.value
              )
            )
            .toList(),
      );

  static Widget _createSnackBarContentRow(BuildContext context, String name,
      String value) =>
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
