# Slide

Spring offers various types of slide transcation. and you can animate and customize them without changing the setting the state.

- slide in right & left.
- slide in top & bottom.
- slide out right & left.
- slide out top & bottom.

## Sipmle Slide 

```dart
Spring.slide(
     slideType: SlideType.slide_in_left,
     child: RedCard())
 ```
 ![simple_slide](https://github.com/KaushickSArgekar/spring/blob/master/assets/simple_slide.gif?raw=true)
 


## Customized slide

```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: () {
            //for controlling the animation..
            springController.play(
              motion: Motion.reverse, //optional
              animDuration: Duration(seconds: 1), //optional
              curve: Curves.bounceInOut, //optional
              delay: Duration(milliseconds: 300), //optional
            );
          },
          child: Spring.slide(
            springController: springController,  //optional
            slideType: SlideType.slide_in_left, //required
            withFade: true, // default false
            animDuration: Duration(seconds: 2), //default 1 second
            //optional
            animStatus: (AnimStatus status) {
              print(status.toString());
            },
            curve: Curves.easeIn, //default Curves.eadInOut
            delay: Duration(milliseconds: 300), //default 0 second
            extend: 30, //default 10
            child: FlutterLogo(size: 100),
          ),
        ),
      ),
    );
  }
}
```
![simple_slide](https://github.com/KaushickSArgekar/spring/blob/master/assets/customized_slide.gif?raw=true)

## withFade
you can set the fade with transaction by enablish **withFade=true** by default the value is false.

```dart
Spring.slide(
   springController: springController,
   slideType: SlideType.slide_in_left,
   withFade: true,
   child: FlutterLogo())
   ```

## extend

You can extend the length of slide transaction with extend paramater, by deafult extend value is **10** extend is used if the widget size is big. Slide defaulty takes start of the screen. as a starting point.

```dart
Spring.slide(
     extend: 30,
     slideType: SlideType.slide_in_left,
     child: FlutterLogo())
```

- For slide_in the extend value should be positive example( **extend=30**).
- And for slide_out & reverse transactoins (**extend = - 30**).

## cutomTweenOffset

Offset of spring animation can be customized using customTweenOffset.
setting the customTweenOffset ignores the parameter slideType.

```dart
Spring.slide(
	slideType: SlideType.slide_in_left,  //ignored
	child: FlutterLogo(),
	cutomTweenOffset: Tween(begin: Offset(-100,0),end: Offset(100,0)))
```

