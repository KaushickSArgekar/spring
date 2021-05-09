# Bubble Button
 ![bubble_button](https://github.com/KaushickSArgekar/spring/blob/master/assets/bubble.gif?raw=true)



## Simple button

```dart
Spring.bubbleButton(
    onTap: () {
        print('tapped');
    },
    child: RedCard()
  ),
 ```


## Customized bubble button

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/blue_card.dart';
import 'package:test123/red_card.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController = SpringController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spring.bubbleButton(
            //optional can use gesture detector
            onTap: () {
              print('tapped');
            },
            animDuration: Duration(seconds: 1), //def=500m mil
            bubbleStart: .4, //def=0.0
            bubbleEnd: .9, //def=1.1
            animStatus: (AnimStatus status) {
              print(status);
            },
            curve: Curves.linear, //Curves.elasticOut
            delay: Duration(milliseconds: 0), //def=0
            child: RedCard(),
          ),
        ],
      )),
    );
  }
}


