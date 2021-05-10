# Opacity

 ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/opacity.gif?raw=true)



## Simple Opacity

```dart
    Spring.opacity(
      startOpacity: 0.1,
      endOpacity: 0.7,
      child: RedCard(),
    ),
 ```


## Customized Opacity

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/red_card.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController = SpringController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Spring.opacity(
            startOpacity: 1,0,
            endOpacity: 0.3,
            animDuration: Duration(seconds: 1), //def=1s
            animStatus: (AnimStatus status) {
              print(status);
            },
            curve: Curves.bounceOut,  //def=Curves.easInOut
            delay: Duration(seconds: 1), //def=0
            child: RedCard(),
          )),
    );
  }
}


