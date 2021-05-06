import 'package:flutter/material.dart';
import 'package:spring/spring.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: SpringExample());
  }
}

class SpringExample extends StatelessWidget {
  final SpringController controller =
      SpringController(initialAnim: Motion.play);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: Spring.card(
                animDuration: Duration(seconds: 5),
                fromWidth: 50,
                toWidth: 100,
                fromHeight: 50,
                fromColor: Colors.amber,
                toColor: Colors.blue,
                toHeight: 300,
                child: Center(
                    child: FittedBox(
                        child: Text(
                  'hello',
                  style: TextStyle(fontSize: 60),
                ))))));
  }
}
