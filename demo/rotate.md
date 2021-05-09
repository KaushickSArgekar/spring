# Roatate

 ![rotate](https://github.com/KaushickSArgekar/spring/blob/master/assets/rotate_one.gif?raw=true)



## Simple Rotate

```dart
  Spring.rotate(child: RedCard())),
 ```
 ![rotate](https://github.com/KaushickSArgekar/spring/blob/master/assets/rotate_two.gif?raw=true)

## Customized Roatate

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/red_card.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController =
      SpringController(initialAnim: Motion.mirror);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Spring.rotate(
          springController: springController,
          alignment: Alignment.bottomCenter, //def=center
          startAngle: 30, //def=0
          endAngle: 250, //def=360
          animDuration: Duration(seconds: 2), //def=1s
          animStatus: (AnimStatus status) {
            print(status);
          },
          curve: Curves.easeInBack, //def=Curves.easInOut
          child: RedCard(),
        ),
      ),
    );
  }
}


```

