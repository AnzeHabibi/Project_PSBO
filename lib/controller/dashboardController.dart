import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class DashboardController extends State<MainPage> {
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

  Future<dynamic> getDashboard() async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response =
          await http.get("http://13.229.135.254:3001/api/dashboard", headers: {
        'Authorization': 'Bearer $token',
      });
      Map<String, dynamic> map = json.decode(response.body);
      sharedPreferences.setString("id", map['user']['_id']);
      // List<dynamic> data = map["MyProjects"];
      //print(data[0]);
      // print(data.toString());
      // print(jsonData);
      return map;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e.toString());
    }
  }
}
