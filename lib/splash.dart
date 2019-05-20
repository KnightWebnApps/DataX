import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:dataX/views/menu.dart';

class LearnXSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(
        image: Image.asset('assets/splash.jpg'),
        seconds: 2,
        navigateAfterSeconds: LearnXMenu(),
        photoSize: 180,
        title: Text("LearnX, SpaceX API App", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
        styleTextUnderTheLoader: TextStyle(color: Colors.white),
      ),
    );
  }
}