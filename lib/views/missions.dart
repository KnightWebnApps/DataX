import 'package:dataX/model/mission.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MissionsPage extends StatefulWidget {
  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {

  

  @override
  Widget build(BuildContext context) {
    
    var missionState = Provider.of<Mission>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Missions"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future:missionState.fetchData(),
        builder: (context, snapshot)=> missionState.isFetching 
        ? Center(
          child: CircularProgressIndicator(),
        )
        : missionState.getResponseJson() != null
          ? ListView.builder(
            itemCount: missionState.getResponseJson().length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(
                  missionState.getResponseJson()[index]['mission_name'] ?? 'No Name'
                ),
                subtitle: Text(
                  missionState.getResponseJson()[index]["mission_id"] ?? "No Id",
                  style: Theme.of(context).textTheme.body1,
                ),
                onTap: (){
                  // Implement Mission Tile Tap
                },
              );
            },
          )
          : Center(
            child: RaisedButton(
            onPressed: (){
              missionState.fetchData();
            },
            child: Text("Reload"),
          )
          ),
      )
    );
  }
}

