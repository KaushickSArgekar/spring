import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';

class SpringRotate extends StatefulWidget {
  final SpringController springController;
  final double startAngle;
  final double endAngle;
  final Alignment alignment;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Function(AnimStatus)? animStatus;
  final Widget child;

  const SpringRotate({
    Key? key,
    required this.springController,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.startAngle,
    required this.endAngle,
    required this.alignment,
    required this.child,
    this.animStatus
  }) : super(key: key);

  @override
  _SpringRotateState createState() => _SpringRotateState();
}

class _SpringRotateState extends State<SpringRotate> {
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
      animationStatusListener: (status) {
        if (widget.animStatus != null) {
          widget.animStatus!(CustomMethods.toAnimStatus(status));
        }
      },
      curve: curve,
      tween: (_degToRad(widget.startAngle))
          .toDouble()
          .tweenTo(_degToRad(widget.endAngle).toDouble()),
      builder: (context, child, value) {
        return Transform.rotate(
          alignment: widget.alignment,
          angle: value,
          child: widget.child,
        );
      },
    );
  }

  num _degToRad(num deg) => deg * (pi / 180.0);

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
