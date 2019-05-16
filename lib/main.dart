import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
////import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flare_flutter/flare_actor.dart';
import 'package:dataX/theme.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DataX',
      debugShowCheckedModeBanner: false,
      theme: theme,
      
      home: FlutterXHome(),
    );
  }
}


class FlutterXHome extends StatefulWidget {
  @override
  _FlutterXHomeState createState() => _FlutterXHomeState();
}

class _FlutterXHomeState extends State<FlutterXHome> {

  List<dynamic> data;
  List<dynamic> upcomingData;
  List<dynamic> launchedData;
  final String url = 'https://api.spacexdata.com/v3/launches';
  YoutubePlayerController _controller = YoutubePlayerController();
 

  getData() async {
    var res = await http.get(
      Uri.encodeFull(url), headers: {
        "Accept": "applcation/json"
      });
    
    var resBody = await json.decode(res.body);
    setState(() {
      
     data = resBody; 

    });
    
   return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            iconSize: 18,
            onPressed: (){
              
              // Implement search via title 
            },
          ),
        ],
        title: Text('Flutter X'),
        centerTitle: true,
        
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data == null? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Center(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ExpansionTile(
                    backgroundColor: Colors.blueGrey,
                    leading: Text(data[index]["flight_number"].toString(), 
                      style: theme.textTheme.body2,),
                    title: Text(data[index]["mission_name"].toString(), 
                      style: theme.textTheme.body1,),
                    trailing: Icon(Icons.arrow_drop_down_circle),
                    children: <Widget>[
                      Image.network(data[index]["links"]["mission_patch_small"].toString()),
                      Text('Launch Date: ${data[index]["launch_date_utc"].toString()}',
                        textAlign: TextAlign.center,

                      ),
                      Text('Launch Site: ${data[index]["launch_site"]["site_name_long"].toString()}', 
                      textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(' ${data[index]["details"].toString()}', 
                        textAlign: TextAlign.center,
                        ),
                      ),
                      ExpansionTile(
                       
                        title: Text('Launch Details'),
                        initiallyExpanded: false,
                        trailing: Icon(Icons.arrow_drop_down_circle),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Was Launch Successful: ${data[index]["launch_success"].toString().toUpperCase()}'),
                          ),
                          data[index]["launch_success"].toString() == 'false'?
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('Reason: ${data[index]["launch_failure_details"]["reason"].toString()}'),
                                  Text('Time: ${data[index]["launch_failure_details"]["time"].toString().toUpperCase()}'),
                                ],
                              ),
                            )
                            :YoutubePlayer(
                              context: context,
                              videoId: data[index]["links"]["youtube_id"].toString(),
                              autoPlay: false,
                              showVideoProgressIndicator: true,
                              onPlayerInitialized: (controller){
                                _controller = controller;
                                
                              },
                            )
                        ],
                      )
                    ],
                    initiallyExpanded: false,

                  ),
                ],
              ),)
            );
          },
        )
      ),  
    );
  }
  @override
  void initState(){
    super.initState();
    this.getData();
    
    
  }
  @override
  void deactivate() {
    // This pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }
}




