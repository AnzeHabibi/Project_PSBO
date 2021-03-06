import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_psbo/model/model.dart';
//import 'package:project_psbo/model/model.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class DetailProjectController extends State<DetailPage> {
  bool _isLoading = false;

  isLoadingTrue() {
    this._isLoading = true;
  }

  isLoadingFalse() {
    this._isLoading = false;
  }

  isLoading() {
    return this._isLoading;
  }

  getDetailProject(String id) async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response = await http
          .get("http://13.229.135.254:3001/api/project/$id", headers: {
        'Authorization': 'Bearer $token',
      });
      var map = json.decode(response.body);
      print("map" + map.toString());
      return map;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }

  assignProject(String id) async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response = await http
          .post("http://13.229.135.254:3001/api/projectMember/$id", headers: {
        'Authorization': 'Bearer $token',
      });
      var map = json.decode(response.body);
      print("map" + map.toString());
      return map;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }
}
