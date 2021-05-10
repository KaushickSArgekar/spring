import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/src/enums.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';



///Translate
class SpringTranslate extends StatefulWidget {
  final SpringController springController;
  final Offset beginOffset;
  final Offset endOffset;
  final Duration delay;
  final Duration duration;
  final Curve curve;
  final Function(AnimStatus)? animStatus;
  final Widget child;

  const SpringTranslate({
    Key? key,
    required this.springController,
    required this.beginOffset,
    required this.endOffset,
    required this.delay,
    required this.duration,
    required this.curve,
    required this.child,
    this.animStatus,
  }) : super(key: key);

  @override
  _SpringTranslateState createState() => _SpringTranslateState();
}

class _SpringTranslateState extends State<SpringTranslate> {
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
    final tween = MultiTween<AniProps>()
      ..add(AniProps.offset, widget.beginOffset.tweenTo(widget.endOffset));

    return CustomAnimation<MultiTweenValues<AniProps>>(
      control: customAnimationControl,
      duration: duration,
      animationStatusListener: (status) {
        if (widget.animStatus != null) {
          widget.animStatus!(CustomMethods.toAnimStatus(status));
        }
      },
      delay: delay,
      curve: curve,
      tween: tween,
      builder: (context, child, value) {
        return Transform.translate(
            offset: value.get(AniProps.offset), child: widget.child);
      },
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
