import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class Capsule with ChangeNotifier{

  Capsule();

  // For API calls
  String _dataUrl = "https://api.spacexdata.com/v3/capsules/";
  String _jsonResonse = '';
  bool _isLoading = false;
  List<dynamic> data = [];

  // For File Manangment
  File _file;
  Directory _dir;
  String _fileName = "capsule.json";
  bool fileExists = false;

  createFile()async{
    await getApplicationDocumentsDirectory()
      .then((Directory directory){
        _dir = directory;
        _file = File(_dir.path + '/' + _fileName);
        _file.create();
        if (fileExists == false){ 
          _file.writeAsString(json.encode(_jsonResonse));
          print('File cached');
        }
        else print("File not Cached");
      });
  }

  

  bool get isFetching => _isLoading;

  Future<void> fetchData() async {    
    _isLoading = true;
  
    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
        _jsonResonse = response.body;
        
    }
    _isLoading = false;
    
    print("Called from Space");
  }

  String get getResponseText => _jsonResonse;

  getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
      
        var json = jsonDecode(_jsonResonse);
        
        data = json;
        return data;
    }
    return null;
  }

  

  
}