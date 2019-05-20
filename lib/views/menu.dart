import 'package:flutter/material.dart';
import 'package:dataX/views/launches.dart';

class LearnXMenu extends StatefulWidget {
  @override
  _LearnXMenuState createState() => _LearnXMenuState();
}

class _LearnXMenuState extends State<LearnXMenu> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
        controller: pageController,
        children: <Widget>[
          LearnXLaunches(),
          Container(color: Colors.black,)
        ],
      ),
    );
  }
}