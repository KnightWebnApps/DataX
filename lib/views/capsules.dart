import 'package:dataX/util/loader.dart';
import 'package:dataX/model/capsule.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CapsulePage extends StatefulWidget {
  @override
  _CapsulePageState createState() => _CapsulePageState();
}

class _CapsulePageState extends State<CapsulePage> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<Capsule>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Capsules"),
        centerTitle: true,
        ),
          body: FutureBuilder(  
            future: appState.fetchData(),             
            builder: (context, snapshot)=>appState.isFetching
            ? Center(
              child: XLoader())
            : appState.getResponseJson() != null
              ? ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: appState.getResponseJson().length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      appState.getResponseJson()[index]["capsule_id"] ??"No Name"),
                    subtitle: Text(
                      appState.getResponseJson()[index]["details"] ?? 'No Details',
                      style: TextStyle(color: Colors.black),
                    )
                  );
                },
              )
              : Center(child:Text("Press Button above to fetch data"),)
        ),   
    );
  }
}

