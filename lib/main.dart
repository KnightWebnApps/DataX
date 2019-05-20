import 'package:dataX/splash.dart';
import 'package:flutter/material.dart';
import 'package:dataX/theme.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataX',
      debugShowCheckedModeBanner: false,
      theme: theme,
      
      home: LearnXSplash(),
    );
  }
}


