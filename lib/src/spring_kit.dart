import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:spring/widgets/animated_card.dart';
import 'package:spring/widgets/blink.dart';
import 'package:spring/widgets/bubble.dart';
import 'package:spring/widgets/fade_in.dart';
import 'package:spring/widgets/flip.dart';
import 'package:spring/widgets/opacity.dart';
import 'package:spring/widgets/pop.dart';
import 'package:spring/widgets/rotate.dart';
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
    Function(AnimStatus)? animStatus,
  }) {
    return SpringSlide(
      slideType: slideType,
      withFade: withFade,
      springController: CustomMethods.checkNullController(springController),
      curve: curve,
      delay: delay,
      duration: animDuration,
      extend: extend,
      cTweenOffset: cutomTweenOffset,
      animStatus: animStatus,
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
    Function(AnimStatus)? animStatus,
    required Widget child,
  }) {
    return SpringScale(
      springController: CustomMethods.checkNullController(springController),
      start: start,
      end: end,
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
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
    Function(AnimStatus)? animStatus,
  }) {
    return SpringBlink(
      springController: CustomMethods.checkNullController(springController),
      startOpacity: startOpacity,
      endOpacity: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
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
    Function(AnimStatus)? animStatus,
  }) {
    return SpringFade(
      springController: CustomMethods.checkNullController(springController),
      startOpacity: startOpacity,
      endOpacity: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
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
    Function(AnimStatus)? animStatus,
  }) {
    return SpringFade(
      springController: CustomMethods.checkNullController(springController),
      startOpacity: startOpacity,
      endOpacity: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
      child: child,
    );
  }

  static Widget pop({
    SpringController? springController,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.bounceOut,
    required Widget child,
    Function(AnimStatus)? animStatus,
  }) {
    return SpringPop(
      springController: CustomMethods.checkNullController(springController),
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
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
    Function(AnimStatus)? animStatus,
  }) {
    return SpringTranslate(
        springController: CustomMethods.checkNullController(springController),
        beginOffset: beginOffset,
        endOffset: endOffset,
        delay: delay,
        duration: animDuration,
        curve: curve,
        animStatus: animStatus,
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
    Function(AnimStatus)? animStatus,
  }) {
    return SpringShake(
        springController: CustomMethods.checkNullController(springController),
        start: start,
        end: end,
        delay: delay,
        duration: animDuration,
        curve: curve,
        animStatus: animStatus,
        child: child);
  }

  static Widget animatedCard({
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
    Curve curve = Curves.easeInOut,
    Clip? clip,
    bool borderOnForeground = true,
    EdgeInsets? margin,
    ShapeBorder? shape,
    bool semanticContainer = true,
    required Widget child,
    Function(AnimStatus)? animStatus,
  }) {
    return AnimatedCard(
        springController: CustomMethods.checkNullController(springController),
        delay: delay,
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
        animStatus: animStatus,
        child: child);
  }

  static Widget rotate({
    SpringController? springController,
    double startAngle = 0.0,
    double endAngle = 360.0,
    Alignment alignment = Alignment.center,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.linear,
    required Widget child,
    Function(AnimStatus)? animStatus,
  }) {
    return SpringRotate(
        springController: CustomMethods.checkNullController(springController),
        startAngle: startAngle,
        endAngle: endAngle,
        alignment: alignment,
        delay: delay,
        duration: animDuration,
        curve: curve,
        animStatus: animStatus,
        child: child);
  }

  static Widget flip({
    SpringController? springController,
    required Widget frontWidget,
    required Widget rearWidget,
    bool toggleOnClick = true,
    Function(String)? onTap,
    Axis flipAxis = Axis.vertical,
    Duration animDuration = const Duration(seconds: 1),
  }) {
    return SpringFlip(
      springController: CustomMethods.checkNullController(springController),
      frontWidget: frontWidget,
      rearWidget: rearWidget,
      flipAxis: flipAxis,
      toogleOnClick: toggleOnClick,
      onTap: onTap,
      duration: animDuration,
    );
  }

  static Widget bubbleButton({
    SpringController? springController,
    VoidCallback? onTap,
    double bubbleStart = 0.0,
    double bubbleEnd = 1.0,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(milliseconds: 500),
    Curve curve = Curves.elasticOut,
    required Widget child,
    Function(AnimStatus)? animStatus,
  }) {
    return Bubble(
      springController: CustomMethods.checkNullController(springController),
      onClick: onTap,
      bubbleStart: bubbleStart,
      bubbleEnd: bubbleEnd,
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
      child: child,
    );
  }

  static Widget opacity({
    SpringController? springController,
    required double startOpacity,
    required double endOpacity,
    Duration delay = const Duration(seconds: 0),
    Duration animDuration = const Duration(seconds: 1),
    Curve curve = Curves.easeInOut,
    required Widget child,
    Function(AnimStatus)? animStatus,
  }) {
    return SpringOpacity(
      springController: CustomMethods.checkNullController(springController),
      start: startOpacity,
      end: endOpacity,
      curve: curve,
      delay: delay,
      duration: animDuration,
      animStatus: animStatus,
      child: child,
    );
  }
}
