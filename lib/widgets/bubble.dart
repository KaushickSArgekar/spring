import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';

class Bubble extends StatefulWidget {
  final SpringController springController;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final double bubbleStart;
  final double bubbleEnd;
  final Widget child;
  final Function(AnimStatus)? animStatus;
  final VoidCallback? onClick;

  const Bubble({
    Key? key,
    required this.springController,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.bubbleStart,
    required this.bubbleEnd,
    required this.child,
    this.animStatus,
    required this.onClick,
  }) : super(key: key);

  @override
  _BubbleState createState() => _BubbleState();
}

class _BubbleState extends State<Bubble> {
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
    return GestureDetector(
      onTap: () {
        setState(() {
          customAnimationControl = CustomAnimationControl.playFromStart;
          if (widget.onClick != null) {
            widget.onClick!();
          }
        });
      },
      child: CustomAnimation<double>(
        control: customAnimationControl,
        duration: duration,
        delay: delay,
        curve: curve,
        animationStatusListener: (status) {
        if (widget.animStatus != null) {
          widget.animStatus!(CustomMethods.toAnimStatus(status));
        }
      },
        tween: (widget.bubbleStart.toDouble())
            .tweenTo(widget.bubbleEnd.toDouble()),
        builder: (context, child, value) {
          return Transform.scale(scale: value, child: widget.child);
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
