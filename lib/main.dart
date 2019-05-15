import 'dart:convert';

////import 'package:flare_flutter/flare_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_x/theme.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter X',
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
  final String url = 'https://api.spacexdata.com/v3/launches';

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
        title: Text('Flutter X'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: data == null? 0 : data.length,
          itemBuilder: (BuildContext context, int index){
            return Container(
              child: Center(child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    elevation: 10.0,
                    
                    color: Colors.black,
                    child: Row(
                      children: <Widget> [
                        Text(data[index]["flight_number"].toString(),
                          style: theme.textTheme.body2
                        ),
                        Text(data[index]["mission_name"].toString(),
                          style: theme.textTheme.body2
                        ),
                      ]
                    )
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
}


