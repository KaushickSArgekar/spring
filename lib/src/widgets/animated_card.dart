import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/enums.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';
import 'package:supercharged/supercharged.dart';

class AnimatedCard extends StatefulWidget {
  final SpringController springController;
  final Duration delay;
  final Curve curve;
  final double fromWidth;
  final double toWidth;
  final double fromHeight;
  final double toHeight;
  final Color fromColor;
  final Color toColor;
  final double fromElevation;
  final double toElevation;
  final Color fromShadowColor;
  final Color toShadowColor;
  final Duration widthDuration;
  final Duration heightDuration;
  final Duration colorDuration;
  final Duration elevationDuration;
  final Duration shadowDuration;
  final Clip? clip;
  final bool borderOnForeground;
  final EdgeInsets? margin;
  final ShapeBorder? shape;
  final bool semanticContainer;
  final Function(AnimStatus)? animStatus;
  final Widget child;

  const AnimatedCard(
      {Key? key,
      required this.springController,
      required this.delay,
      required this.curve,
      required this.fromWidth,
      required this.toWidth,
      required this.fromHeight,
      required this.toHeight,
      required this.fromColor,
      required this.toColor,
      required this.fromElevation,
      required this.toElevation,
      required this.fromShadowColor,
      required this.toShadowColor,
      required this.widthDuration,
      required this.heightDuration,
      required this.colorDuration,
      required this.elevationDuration,
      required this.shadowDuration,
      this.clip,
      this.borderOnForeground = true,
      this.margin,
      this.semanticContainer = true,
      this.shape,
      this.animStatus,
      required this.child})
      : super(key: key);

  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  late CustomAnimationControl customAnimationControl;
  late Duration delay;
  late Curve curve;
  late Duration widthDuation;
  late Duration heightDuration;
  late Duration colorDuration;
  late Duration elevationDuration;
  late Duration shadowDuration;

  @override
  void initState() {
    widget.springController.controller.stream.listen((event) {
      setState(() {
        delay =
            event.delay == CustomMethods.cDuartion ? widget.delay : event.delay;
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
      curve = widget.curve;
      widthDuation = widget.widthDuration;
      heightDuration = widget.heightDuration;
      colorDuration = widget.colorDuration;
      elevationDuration = widget.elevationDuration;
      shadowDuration = widget.shadowDuration;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _tween = MultiTween<CardProps>()
      ..add(CardProps.width, widget.fromWidth.tweenTo(widget.toWidth),
          widthDuation)
      ..add(CardProps.height, widget.fromHeight.tweenTo(widget.toHeight),
          heightDuration)
      ..add(CardProps.elevation,
          widget.fromElevation.tweenTo(widget.toElevation), elevationDuration)
      ..add(CardProps.color, widget.fromColor.tweenTo(widget.toColor),
          colorDuration)
      ..add(CardProps.shadowColor,
          widget.fromShadowColor.tweenTo(widget.toShadowColor), shadowDuration);

    return CustomAnimation<MultiTweenValues<CardProps>>(
      control: customAnimationControl,
      duration: _tween.duration,
      curve: curve,
      animationStatusListener: (status) {
        if (widget.animStatus != null) {
          widget.animStatus!(CustomMethods.toAnimStatus(status));
        }
      },
      tween: _tween,
      builder: (context, child, value) {
        return SizedBox(
          width: value.get(CardProps.width),
          height: value.get(CardProps.height),
          child: Card(
            clipBehavior: widget.clip,
            borderOnForeground: widget.borderOnForeground,
            margin: widget.margin,
            shape: widget.shape,
            semanticContainer: widget.semanticContainer,
            color: value.get(CardProps.color),
            elevation: value.get(CardProps.elevation),
            shadowColor: value.get(CardProps.shadowColor),
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
