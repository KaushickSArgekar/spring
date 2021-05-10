import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/spring_controller.dart';


/// Flip
class SpringFlip extends StatefulWidget {
  final SpringController springController;
  final Duration duration;
  final Widget frontWidget;
  final Widget rearWidget;
  final Axis flipAxis;
  final bool toogleOnClick;
  final Function(String)? onTap;

  const SpringFlip({
    Key? key,
    required this.springController,
    required this.duration,
    required this.flipAxis,
    required this.frontWidget,
    required this.rearWidget,
    required this.toogleOnClick,
    required this.onTap,
  }) : super(key: key);

  @override
  _SpringFlipState createState() => _SpringFlipState();
}

class _SpringFlipState extends State<SpringFlip> {
  late Duration delay;
  late Duration duration;
  late bool _showFrontSide;
  late Axis flipAxis;
  late bool toggleOnClick;

  @override
  void initState() {
    _showFrontSide = true;
    widget.springController.controller.stream.listen((event) {
      setState(() {
        duration = event.animDuartion == CustomMethods.cDuartion
            ? widget.duration
            : event.animDuartion;
        _showFrontSide = !_showFrontSide;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      duration = widget.duration;
      flipAxis = widget.flipAxis;
      toggleOnClick = widget.toogleOnClick;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (toggleOnClick) {
          setState(() {
            _showFrontSide = !_showFrontSide;
          });
        }
        if (widget.onTap != null) {
          _showFrontSide ? widget.onTap!('front') : widget.onTap!('rear');
        }
      },
      child: AnimatedSwitcher(
        duration: duration,
        transitionBuilder: _transcationBuilder,
        layoutBuilder: (widget, list) => Stack(children: [widget!, ...list]),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeInBack.flipped,
        child: _showFrontSide ? _buildFront() : _buildRear(),
      ),
    );
  }

  Widget _transcationBuilder(Widget widget, Animation<double> animation) {
    final flipAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: flipAnim,
      builder: (context, widget) {
        final isUnder = (ValueKey(_showFrontSide) != widget!.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder ? min(flipAnim.value, pi / 2) : flipAnim.value;
        return Transform(
          transform: flipAxis == Axis.horizontal
              ? (Matrix4.rotationY(value)..setEntry(3, 0, tilt))
              : (Matrix4.rotationX(value)..setEntry(3, 1, tilt)),
          alignment: Alignment.center,
          child: widget,
        );
      },
      child: Center(child: widget),
    );
  }

  Widget _buildFront() {
    return __buildLayout(key: ValueKey(true), child: widget.frontWidget);
  }

  Widget _buildRear() {
    return __buildLayout(key: ValueKey(false), child: widget.rearWidget);
  }

  Widget __buildLayout({required ValueKey<bool> key, required Widget child}) {
    return SizedBox(
      key: key,
      child: Center(child: child),
    );
  }

  @override
  void dispose() {
    widget.springController.controller.close();
    super.dispose();
  }
}
