import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:spring/spring.dart';
import 'package:spring/src/methods.dart';
import 'package:spring/src/widgets/slide.dart';
import 'package:supercharged/supercharged.dart';
import 'package:spring/src/sized_context.dart';

class SlideMethods {
  static MultiTween<AniProps> getTween(BuildContext context, SpringSlide widget) {
    final extend = widget.extend;
    switch (widget.slideType) {
      case SlideType.slide_in_left:
        return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (0.0).tweenTo(1.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset, widget.cTweenOffset ?? Offset(-(context.widthPx / 2) + extend, 0).tweenTo(Offset(0, 0)));

      case SlideType.slide_in_right:
        return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (0.0).tweenTo(1.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
              widget.cTweenOffset ??  Offset((context.widthPx / 2) + extend, 0).tweenTo(Offset(0, 0)));
      case SlideType.slide_in_top:
        return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (0.0).tweenTo(1.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
              widget.cTweenOffset ??  Offset(0, -(context.heightPx / 2 + extend)).tweenTo(Offset(0, 0)));
      case SlideType.slide_in_bottom:
        return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (0.0).tweenTo(1.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
              widget.cTweenOffset ??  Offset(0, (context.heightPx / 2) + extend).tweenTo(Offset(0, 0)));
      case SlideType.slide_out_left:
        return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (1.0).tweenTo(0.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
              widget.cTweenOffset ??   Offset(0, 0).tweenTo(Offset(-(context.widthPx / 2 + extend), 0)));
      case SlideType.slide_out_right:
        return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (1.0).tweenTo(0.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
             widget.cTweenOffset ??   Offset(0, 0).tweenTo(Offset((context.widthPx / 2 + extend), 0)));
      case SlideType.slide_out_top:
      return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (1.0).tweenTo(0.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
             widget.cTweenOffset ??   Offset(0, 0).tweenTo(Offset(0, -(context.heightPx/2+extend))));
      case SlideType.slide_out_bottom:
       return MultiTween<AniProps>()
          ..add(AniProps.opacity,
              widget.withFade ? (1.0).tweenTo(0.0) : (1.0).tweenTo(1.0))
          ..add(AniProps.offset,
             widget.cTweenOffset ??   Offset(0, 0).tweenTo(Offset(0, (context.heightPx/2+extend))));
    }
  }
}
