import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Mission with ChangeNotifier{
  Mission();

  String _dataUrl = "https://api.spacexdata.com/v3/missions/";
  String _jsonResonse = "";
  bool _isLoading = false;
  List<dynamic> data = [];

  bool get isFetching => _isLoading;

  

  Future<void> fetchData() async {
    _isLoading = true;
    

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
        _jsonResonse = response.body;
    }

    _isLoading = false;
    

   
  }

  String get getResponseText => _jsonResonse;

  getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
        var _json = jsonDecode(_jsonResonse);
        data = _json;
        return data;
    }
    return null;
  }
}