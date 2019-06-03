import 'package:dataX/model/capsule.dart';
import 'package:dataX/model/mission.dart';
import 'package:dataX/theme.dart';
import 'package:dataX/views/capsules.dart';
import 'package:dataX/views/launches.dart';
import 'package:dataX/views/missions.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<dynamic> capsuleData =[];
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: ListView(
        children: <Widget>[
          LaunchCard(),
          CapsuleCard(),
          MissionCard()
        ],
      ),
    );
  }
}

class CapsuleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
            onTap: (){
              
              Navigator.push(context, MaterialPageRoute(
                builder: (context)=>ChangeNotifierProvider<Capsule>(
                  builder: (_)=>Capsule(),
                  child: CapsulePage()
                ),
              )
              );
            },
            child: Card(
              elevation: 10.0,
              
              color: Colors.deepOrange,
              margin: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                Placeholder(
                  fallbackHeight: 325,
                  color: Colors.black,
                ) 
                ],
              ),
            ),
          );
  }
}

class LaunchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>LearnXLaunches()
        )
        );
      },
      child: Card(
        elevation: 10.0,
        color: Colors.deepOrange,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/rocket.png', 
              height: 500,  
              fit: BoxFit.fill,
              alignment: Alignment.center,
            ),
            height: 400,
          ),
          Center(
            child: Text("View Launches", style: theme.textTheme.headline,),
          )
          ],
        ),
      ),
    );
  }
}

class MissionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>ChangeNotifierProvider<Mission>(
            builder: (context)=> Mission(),
            child: MissionsPage(),
          )
        )
        );
      },
      child: Card(
        elevation: 10.0,
        color: Colors.deepOrange,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
          Placeholder(
            fallbackHeight: 325,
            color: Colors.black,
          ) 
          ],
        ),
      ),
    );
  }
}