import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

extension AnimationControllerExtension on AnimationController {

  void forwardReverse(VoidCallback callback) =>
      forward().then((_) {
        reverse();
        if (null != callback) {
          callback();
        }
      });

  void forwardReset(VoidCallback callback) =>
      forward().then((_) {
        reset();
        if (null != callback) {
          callback();
        }
      });
}
