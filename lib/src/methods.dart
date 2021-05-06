import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/src/enums.dart';
import 'package:spring/src/spring_controller.dart';

enum AniProps { opacity, offset }

class CustomMethods {
  static Duration cDuartion = Duration(microseconds: 878765);
  static Curve cCurve = Curves.easeInOutQuint;

  static CustomAnimationControl initialAnim(Motion? initialAnim) {
    if (initialAnim == null) {
      return CustomAnimationControl.playFromStart;
    } else {
      switch (initialAnim) {
        case Motion.play:
          return CustomAnimationControl.playFromStart;
        case Motion.pause:
          return CustomAnimationControl.stop;
        case Motion.reverse:
          return CustomAnimationControl.playReverseFromEnd;
        case Motion.loop:
          return CustomAnimationControl.loop;
        case Motion.mirror:
          return CustomAnimationControl.mirror;
      }
    }
  }

  static SpringController checkNullController(
      SpringController? springController) {
    var controller;

    if (springController == null) {
      controller = SpringController(initialAnim: Motion.play);
    } else {
      controller = springController;
    }
    return controller;
  }

  static CustomAnimationControl motionToCustomAnimController(Motion motion) {
    switch (motion) {
      case Motion.play:
        return CustomAnimationControl.playFromStart;

      case Motion.pause:
        return CustomAnimationControl.stop;

      case Motion.reverse:
        return CustomAnimationControl.playReverseFromEnd;

      case Motion.loop:
        return CustomAnimationControl.loop;

      case Motion.mirror:
        return CustomAnimationControl.mirror;
    }
  }

  static Motion customAnimationControlToMotion(
      CustomAnimationControl customAnimationControl) {
    if (customAnimationControl == CustomAnimationControl.playFromStart) {
      return Motion.play;
    } else if (customAnimationControl ==
        CustomAnimationControl.playReverseFromEnd) {
      return Motion.reverse;
    } else if (customAnimationControl == CustomAnimationControl.loop) {
      return Motion.loop;
    } else if (customAnimationControl == CustomAnimationControl.mirror) {
      return Motion.reverse;
    } else {
      return Motion.play;
    }
  }
}
