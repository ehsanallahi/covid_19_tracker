import 'dart:convert';

import 'package:covid_19_tracker/Services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Model/WorldStatsModel.dart';

class StatesServices {
  Future<WorldStatsModel> fetchWorldStatsRecords()async{
    final response =await http.get(Uri.parse(AppUrl.worldStatesApi));
    if (response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    }else{
      throw Exception('Error');
    }
  }
}