import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';

class Fade extends StatefulWidget {
  final SpringController springController;
  final double startOpacity;
  final double endOpacity;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Widget child;

  const Fade({
    Key? key,
    required this.springController,
    required this.startOpacity,
    required this.endOpacity,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.child,
  }) : super(key: key);

  @override
  _FadeState createState() => _FadeState();
}

class _FadeState extends State<Fade> {
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
      tween: (widget.startOpacity.toDouble())
          .tweenTo(widget.endOpacity.toDouble()),
      builder: (context, child, value) {
        return Opacity(opacity: value, child: widget.child);
      },
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
