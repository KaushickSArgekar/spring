import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:spring/widgets/animated_card.dart';
import 'package:spring/widgets/blink.dart';
import 'package:spring/widgets/fade_in.dart';
import 'package:spring/widgets/pop.dart';
import 'package:spring/widgets/scale.dart';
import 'package:spring/widgets/shake.dart';
import 'package:spring/widgets/slide.dart';
import 'package:spring/widgets/translate.dart';

class Spring {
  static Widget slide({
    required SlideType slideType,
    bool withFade = false,
    SpringController? springController,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    double extend = 0.0,
    Tween<Offset>? cutomTweenOffset,
    required Widget child,
  }) {
    return Slide(
      slideType: slideType,
      withFade: withFade,
      springController: CustomMethods.checkNullController(springController),
      curve: curve,
      delay: delay,
      duration: animDuration,
      extend: extend,
      cTweenOffset: cutomTweenOffset,
      child: child,
    );
  }

  static Widget scale({
    SpringController? springController,
    required double start,
    required double end,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    required Widget child,
  }) {
    return Scale(
      springController: CustomMethods.checkNullController(springController),
      start: start,
      end: end,
      curve: curve,
      delay: delay,
      duration: animDuration,
      child: child,
    );
  }

  static Widget blink({
    SpringController? springController,
    double startOpacity = 0.0,
    double endOpacity = 1.0,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.fastLinearToSlowEaseIn,
    required Widget child,
  }) {
    return Blink(
      springController: CustomMethods.checkNullController(springController),
      startOpacity: startOpacity,
      endOpacity: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      child: child,
    );
  }

  static Widget fadeIn({
    SpringController? springController,
    double startOpacity = 1.0,
    double endOpacity = 0.0,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    required Widget child,
  }) {
    return Fade(
      springController: CustomMethods.checkNullController(springController),
      startOpacity: startOpacity,
      endOpacity: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      child: child,
    );
  }

  static Widget fadeOut({
    SpringController? springController,
    double startOpacity = 1.0,
    double endOpacity = 0.0,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    required Widget child,
  }) {
    return Fade(
      springController: CustomMethods.checkNullController(springController),
      startOpacity: startOpacity,
      endOpacity: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      child: child,
    );
  }

  static Widget pop({
    SpringController? springController,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.bounceOut,
    required Widget child,
  }) {
    return Pop(
      springController: CustomMethods.checkNullController(springController),
      curve: curve,
      delay: delay,
      duration: animDuration,
      child: child,
    );
  }

  static Widget translate({
    SpringController? springController,
    required Offset beginOffset,
    required Offset endOffset,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    required Widget child,
  }) {
    return Translate(
        springController: CustomMethods.checkNullController(springController),
        beginOffset: beginOffset,
        endOffset: endOffset,
        delay: delay,
        duration: animDuration,
        curve: curve,
        child: child);
  }

  static Widget shake({
    SpringController? springController,
    double start = 50.0,
    double end = 120.0,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    required Widget child,
  }) {
    return Shake(
        springController: CustomMethods.checkNullController(springController),
        start: start,
        end: end,
        delay: delay,
        duration: animDuration,
        curve: curve,
        child: child);
  }

  static Widget card({
    SpringController? springController,
    required double fromWidth,
    required double toWidth,
    required double fromHeight,
    required double toHeight,
    Color fromColor = Colors.white,
    Color toColor = Colors.white,
    double fromElevation = 0.0,
    double toElevation = 10.0,
    Color fromShadowColor = Colors.black,
    Color toShadowColor = Colors.black,
    Duration widthDuration = const Duration(seconds: 1),
    Duration heightDuration = const Duration(seconds: 1),
    Duration colorDuration = const Duration(seconds: 1),
    Duration elevationDuration = const Duration(seconds: 1),
    Duration shadowDuration = const Duration(seconds: 1),
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    Clip? clip,
    bool borderOnForeground = true,
    EdgeInsets? margin,
    ShapeBorder? shape,
    bool semanticContainer = true,
    required Widget child,
  }) {
    return AnimatedCard(
        springController: CustomMethods.checkNullController(springController),
        delay: delay,
        duration: animDuration,
        curve: curve,
        fromWidth: fromWidth,
        toWidth: toWidth,
        fromHeight: fromHeight,
        toHeight: toHeight,
        fromColor: fromColor,
        toColor: toColor,
        fromElevation: fromElevation,
        toElevation: toElevation,
        fromShadowColor: fromShadowColor,
        toShadowColor: toShadowColor,
        widthDuration: widthDuration,
        heightDuration: heightDuration,
        colorDuration: colorDuration,
        elevationDuration: elevationDuration,
        shadowDuration: shadowDuration,
        borderOnForeground: borderOnForeground,
        clip: clip,
        margin: margin,
        semanticContainer: semanticContainer,
        shape: shape,
        child: child);
  }
}
