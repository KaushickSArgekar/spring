# Flip

 ![flip](https://github.com/KaushickSArgekar/spring/blob/master/assets/flip.gif?raw=true)



## Simple Flip

```dart
Spring.flip(
    frontWidget: RedCard(),
    rearWidget: BlueCard(),
),
 ```


## Customized Flip example

```dart
iimport 'package:flutter/material.dart';
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
        child: Spring.flip(
          springController: springController,
          frontWidget: RedCard(), //required
          rearWidget: BlueCard(), //required
          flipAxis: Axis.vertical, //def=Axis.horizantal
          onTap: (side) {
            //only Motion.play and anim Duration are accepted here.
            springController.play();
            print(side); //front or rear
          },
          //you can disable flip on click
          toggleOnClick: false, //def=true
          animDuration: Duration(seconds: 2), //def=1s
        ),
      ),
    );
  }
}


