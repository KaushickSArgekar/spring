![Spring Logo](https://github.com/KaushickSArgekar/spring/blob/master/assets/logo.jpg?raw=true "Spring Logo")

> A simple & powerfull pre-built animation kit.



## 🔨 Installation
```yaml
dependencies:
     spring: ^2.0.2
```

 ![simple_fade](https://github.com/KaushickSArgekar/spring/blob/master/assets/spring_main.gif?raw=true)





# 🎥 Spring Animations

- [Slide](example/slide.md)
- [Scale](example/scale.md)
- [Animated Card](example/animated_card.md)
- [Flip](example/flip.md)
- [Fade In & Out](example/fade_in_out.md)
- [Opacity](example/opacity.md)
-  [Bubble Button](example/bubble_button.md)
-  [Blink](example/blink.md)
-  [Pop](example/pop.md)
-  [Shake](example/shake.md)
-  [Rotate](example/rotate.md)
-  [Translate](example/translate.md)

### ⚙ Import

```dart
import 'package:spring/spring.dart';
```

## 🕹️ Usage
```dart
Spring.slide(
     slideType: SlideType.slide_in_right,
     child: FlutterLogo(),
),
```

## 🕹️  Advanced Usage
```dart
import 'package:flutter/material.dart';
import 'package:spring/spring.dart';
import 'package:test123/blue_card.dart';
import 'package:test123/red_card.dart';

class SpringExample extends StatelessWidget {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Spring.slide(
          springController: springController,
          slideType: SlideType.slide_in_right,
          delay: Duration(milliseconds: 500),
          animDuration: Duration(milliseconds: 1000),
          curve: Curves.easeInExpo,
          extend: 30,
          withFade: true,
          animStatus: (AnimStatus status) {
            print(status);
          },
          child: GestureDetector(
              onTap: () {
                springController.play(motion: Motion.reverse);
              },
              child: FlutterLogo()),
        ),
      ),
    );
  }
}
```

## 🎮 SpringController

##### SpringController allow you to control the animations without setting the setState.

```dart

//initial anim = Motion.play
final SpringController springController =
     SpringController(); 
// you can set the initial anim using initialAnim param..
final SpringController springController =
      SpringController(initialAnim: Motion.pause,);
```

### Controlling the animations

```dart
GestureDetector(
          onTap: () {
            springController.play(
                motion: Motion.reverse,
                animDuration: Duration(milliseconds: 300),
                curve: Curves.bounceIn,
                delay: Duration(milliseconds: 900));
          },
          child: Spring.slide(
              springController: springController,
              slideType: SlideType.slide_in_right,
              delay: Duration(milliseconds: 500),
              animDuration: Duration(milliseconds: 1000),
              curve: Curves.easeInExpo,
              extend: 30,
              withFade: true,
              animStatus: (AnimStatus status) {
                print(status);
              },
              child: FlutterLogo()),
        ),
```

## 🔈 Animation Status

 You can listen for animation Staus via **animStatus** callBack
 which returns **AnimStatus** enum.

 - AnimStatus.forward
 - AnimStatus.completed
 - AnimStatus.reverse
 - AnimStatus.dismissed
  
```dart
Spring.rotate(
     springController: springController,
     animStatus: (AnimStatus status) {
          print(status);
     },
     child: FlutterLogo()),

```


## 🐞 Bugs/Requests

If you encounter any problems please open an issue. If you feel the library is missing a feature, please raise a ticket on Github and we'll look into it. Pull request are welcome.

## 🙏 Thanks

- A special thanks to Felix Blaschke for his [simple_animations](https://pub.dev/packages/simple_animations) & [supercharged](https://pub.dev/packages/supercharged) packages. This package literally depends on it.
- Thanks to gskinner.com for [universal_platform](https://pub.dev/packages/universal_platform) package.


## 📃 License

MIT License
