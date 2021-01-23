import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

extension AnimationControllerExtension on AnimationController {

  void forwardReverse(VoidCallback callback) =>
      forward().then((_) {
        reverse();
        callback();
      });

  void forwardReset(VoidCallback callback) =>
      forward().then((_) {
        reset();
        callback();
      });
}
