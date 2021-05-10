# Scale

 ![scale](https://github.com/KaushickSArgekar/spring/blob/master/assets/scale_one.gif?raw=true)



## Simple Scale

```dart
   Row(children: [
        Spring.scale( //animation lik e zoomOut
            start: 1.0,
            end: 0.2,
            child: RedCard(),
          ),
          Spring.scale( //animation lik e zoomIn
            start: 0.2,
            end: 1.0,
            child: BlueCard(),
          ),
        ],
      )
 ```


 ![scale](https://github.com/KaushickSArgekar/spring/blob/master/assets/scale_two.gif?raw=true)


## Customized Scale example

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
          child: GestureDetector(
            onTap: () {
              //reverse the animation on red card click with changed curve
              springController.play(
                  motion: Motion.reverse, curve: Curves.easeInOut);
            },
            child: Spring.scale(
              springController: springController,
              start: 0.0, //required
              end: 1.0, //required
              animDuration: Duration(milliseconds: 2000), //def=1s,
              animStatus: (AnimStatus status) {
                print(status);
              },
              curve: Curves.bounceOut, //def=Curves.easeInOut
              child: RedCard(),
            ),
          )),
    );
  }
}


