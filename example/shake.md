 ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/shake_one.gif?raw=true)



## Simple Shake

```dart
   Spring.shake(child: RedCard()),
 ```

  ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/shake_two.gif?raw=true)


## Customized Shake

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/demo_widget.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController =
      SpringController(initialAnim: Motion.loop);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Spring.shake(
            springController: springController,
            child: RedCard(),
            animDuration: Duration(milliseconds: 2000),
            start: 100,
            end: 40),
      ),
    );
  }
}


```

