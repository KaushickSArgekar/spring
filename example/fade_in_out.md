# FadeIn & FadeOut

 ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/fade_one.gif?raw=true)



## Simple Fade

```dart
     Row(
         children: [
            Spring.fadeIn(child: RedCard()),
            Spring.fadeOut(child: RedCard())
          ],
        );
 ```

 ![c_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/fade_two.gif?raw=true)

## Customized Fade

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/demo_widget.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: InkWell(
            onTap: () {

             //mirrio animation played on clicking the button
              springController.play(
                  motion: Motion.mirror,
                  animDuration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
              //stops the animation after 4 seconds
              Future.delayed(Duration(seconds: 4), () {
                springController.play(motion: Motion.pause);
              });
            },
            child: Spring.fadeIn(
              //optional
              springController: springController, //used to control animation
              startOpacity: .3,// default  fadeIn= 0.0 fadeOut= 1.0 
              endOpacity: .8, // default  fadeIn= 0.0 fadeOut= 1.0 
              animDuration: Duration(microseconds: 700), //default = 1
              animStatus: (AnimStatus status) {
                print(status);
              },
              curve: Curves.bounceIn, //deafult=Curves.easInOut
              delay: Duration(seconds: 1), //deafult = 1 second
              child: RedCard(),
            ),
          ),
        ));
  }
}

```

