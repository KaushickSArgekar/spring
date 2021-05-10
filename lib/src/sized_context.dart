import 'dart:math';

import 'package:flutter/material.dart';
import 'package:universal_platform/universal_platform.dart';

extension SizedContext on BuildContext {
  double get pixelsPerInch =>
      UniversalPlatform.isAndroid || UniversalPlatform.isIOS ? 150 : 96;

  MediaQueryData get mq => MediaQuery.of(this);

  bool get isLandscape => mq.orientation == Orientation.landscape;

  Size get sizePx => mq.size;

  double get widthPx => sizePx.width;

  double get heightPx => sizePx.height;
}
