import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';


///Pop
class SpringPop extends StatefulWidget {
  final SpringController springController;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Function(AnimStatus)? animStatus;
  final Widget child;

  const SpringPop({
    Key? key,
    required this.springController,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.child,
    this.animStatus,
  }) : super(key: key);

  @override
  _SpringPopState createState() => _SpringPopState();
}

class _SpringPopState extends State<SpringPop> {
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
      tween: (1.0).tweenTo(0.0),
      builder: (context, child, value) {
        return Transform.scale(scale: value, child: widget.child);
      },
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
