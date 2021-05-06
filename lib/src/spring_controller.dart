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

class SpringController {
  final Motion? initialAnim;

  SpringController({this.initialAnim});

  final StreamController<SpringAnimation> controller =
      StreamController<SpringAnimation>.broadcast();

  void play(
      {motion = Motion.play,
      Duration? delay,
      Duration? animDuration,
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
