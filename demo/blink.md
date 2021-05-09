# Blink

 ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/blink.gif?raw=true)



## Simple Blink

```dart
    Spring.blink(child: RedCard())
 ```



## Customized Blink

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/demo_widget.dart';

class SpringExample extends StatelessWidget {
  /* initial motion for blink is Motion.mirror
   which is automatically take by spring */
  final SpringController springController = SpringController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Spring.blink(
          springController: springController, //control animations
          startOpacity: 0.3, //default=0.0
          endOpacity: 0.9, //default=1.1
          child: RedCard(),
        ),
      ),
    );
  }
}

```

