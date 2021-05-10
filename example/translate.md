# Translate

 ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/translate.gif?raw=true)



## Simple Translate

```dart
   Spring.translate(
          beginOffset: Offset(100, 30),
          endOffset: Offset(-39, 200),
          child: RedCard(),
        ),
 ```


## Customized Translate

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/red_card.dart';

class SpringExample extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Spring.translate(
          beginOffset: Offset(100, 30), //required
          endOffset: Offset(-39, -200), //required
          animDuration: Duration(seconds: 1), //def=1s
          animStatus: (AnimStatus status) {
            print(status);
          },
          curve: Curves.bounceInOut, //def=Curves.easInOut
          delay: Duration(seconds: 1), //def=0
          child: RedCard(),
        ),
      ),
    );
  }
}

