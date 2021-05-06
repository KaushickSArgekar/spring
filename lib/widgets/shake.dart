import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';
import 'package:vector_math/vector_math_64.dart';

class Shake extends StatefulWidget {
  final SpringController springController;
  final double start;
  final double end;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Widget child;

  const Shake({
    Key? key,
    required this.springController,
    required this.start,
    required this.end,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.child,
  }) : super(key: key);

  @override
  _ShakeState createState() => _ShakeState();
}

class _ShakeState extends State<Shake> {
  late CustomAnimationControl customAnimationControl;
  late Duration delay;
  late Duration duration;
  late Curve curve;

  @override
  void initState() {
    widget.springController.controller.stream.listen((event) {
      setState(() {
        delay =
            event.delay == CustomMethods.cDuartion ? widget.delay : event.delay;
        duration = event.animDuartion == CustomMethods.cDuartion
            ? widget.duration
            : event.animDuartion;
        curve =
            event.curve == CustomMethods.cCurve ? widget.curve : event.curve;
        customAnimationControl = event.customAnimationControl;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      customAnimationControl =
          CustomMethods.initialAnim(widget.springController.initialAnim);
      delay = widget.delay;
      duration = widget.duration;
      curve = widget.curve;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<double>(
      control: customAnimationControl,
      duration: duration,
      delay: delay,
      curve: curve,
      tween: (widget.start).tweenTo(widget.end),
      builder: (context, child, value) {
        return Transform(
          transform: Matrix4.translation(_shake(value)),
          child: widget.child,
        );
      },
    );
  }

  Vector3 _shake(double progress) {
    var offset = sin(progress * pi * 10.0);
    return Vector3(offset * 4, 0.0, 0.0);
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
