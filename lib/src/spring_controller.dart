import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/src/enums.dart';
import 'package:spring/src/methods.dart';

class SpringAnimation {
  final CustomAnimationControl customAnimationControl;
  final Duration delay;
  final Duration animDuartion;
  final Curve curve;

  SpringAnimation(
      this.customAnimationControl, this.delay, this.animDuartion, this.curve);
}

/// SpringController
class SpringController {
  /// initial motion is Motion.play
  final Motion? initialAnim;

  SpringController({this.initialAnim});

  final StreamController<SpringAnimation> controller =
      StreamController<SpringAnimation>.broadcast();

  /// play()
  void play(

      ///Motion
      {motion = Motion.play,

      // Duration
      Duration? delay,

      ///AnimDuation
      Duration? animDuration,

      ///Curve
      Curve? curve}) {
    var cDelay = delay ?? CustomMethods.cDuartion;
    var cDuation = animDuration ?? CustomMethods.cDuartion;
    var cCurve = curve ?? CustomMethods.cCurve;
    controller.add(SpringAnimation(
        CustomMethods.motionToCustomAnimController(motion),
        cDelay,
        cDuation,
        cCurve));
  }
}
