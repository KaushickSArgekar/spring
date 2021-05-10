# Animated Card


 ![animated_card](https://github.com/KaushickSArgekar/spring/blob/master/assets/animated_card.gif?raw=true)


## Simple card 
```dart
Spring.animatedCard(
    fromWidth: 20, 
    toWidth: 170, 
    fromHeight: 20,
    toHeight: 150,
    child: FlutterLogo())),
 ```
## Customized Card example

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController = SpringController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            //animation will be reversed on click
            springController.play(motion: Motion.reverse);
          },
          child: Spring.animatedCard(
              springController: springController,
              fromWidth: 20, //required
              toWidth: 170, //required
              widthDuration: Duration(seconds: 1), //def=1s
              fromHeight: 20,//required
              toHeight: 150,//required
              heightDuration: Duration(seconds: 3), //def=1s
              fromColor: Colors.blueAccent, //def=Colors.white
              toColor: Colors.redAccent, //def=Colors.white
              colorDuration: Duration(seconds: 3), //def=1s
              fromElevation: 3, //def=10
              toElevation: 15, //def=10
              elevationDuration: Duration(seconds: 4),  //def=1s
              fromShadowColor: Colors.blue,  //def=Colors.black
              toShadowColor: Colors.black, //def=Colors.black
              shadowDuration: Duration(seconds: 2), //def=1s
              animStatus: (AnimStatus staus) {
                print(staus);
              },
              child: Icon(
                Icons.animation,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}

