import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/slide_methods.dart';
import 'package:spring/src/spring_controller.dart';


/// Slide
class SpringSlide extends StatefulWidget {
  final SpringController springController;
  final SlideType slideType;
  final bool withFade;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final double extend;
  final Tween<Offset>? cTweenOffset;
  final Function(AnimStatus)? animStatus;
  final Widget child;

  const SpringSlide({
    Key? key,
    required this.springController,
    required this.withFade,
    required this.slideType,
    required this.delay,
    required this.duration,
    required this.animStatus,
    required this.curve,
    required this.extend,
    this.cTweenOffset,
    required this.child,
  }) : super(key: key);

  @override
  _SpringSlideState createState() => _SpringSlideState();
}

class _SpringSlideState extends State<SpringSlide> {
  late CustomAnimationControl customAnimationControl;
  late Duration delay;
  late Duration duration;
  late Curve curve;
  late MultiTween<AniProps> tween;

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
      tween = SlideMethods.getTween(context, widget);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<MultiTweenValues<AniProps>>(
      control: customAnimationControl,
      tween: tween,
      animationStatusListener: (status) {
        if (widget.animStatus != null) {
          widget.animStatus!(CustomMethods.toAnimStatus(status));
        }
      },
      delay: delay,
      duration: duration,
      curve: curve,
      builder: (context, child, value) {
        return Opacity(
            opacity: value.get(AniProps.opacity),
            child: CustomAnimation<MultiTweenValues<AniProps>>(
              control: customAnimationControl,
              tween: tween,
              delay: delay,
              duration: duration,
              curve: curve,
              builder: (___, __, _) {
                return Transform.translate(
                  offset: value.get(AniProps.offset),
                  child: widget.child,
                );
              },
            ));
      },
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
