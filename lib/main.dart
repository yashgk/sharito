import 'package:flutter/material.dart';
import 'package:sharito/SplashScreen.dart';
import 'package:sharito/HomeScreen.dart';
import 'package:simple_splashscreen/simple_splashscreen.dart';

void main() {
 runApp(new MaterialApp(
   debugShowCheckedModeBanner: false,
   home: Start(),
 ));
}

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
   return Simple_splashscreen(
      context: context,
      gotoWidget: HomeScreen(),
      splashscreenWidget: SplashScreen(),
      timerInSeconds: 5,
    );
  }
}







