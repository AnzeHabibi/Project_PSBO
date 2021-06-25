import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class MyProjectController extends State<MyProjectPage> {
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

  getMyProject(int page) async {
    setState(() {
      isLoadingTrue();
    });
    //var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response = await http.get(
          "http://13.229.135.254:3001/api/project/myproject?page=" +
              page.toString(),
          headers: {
            'Authorization': 'Bearer $token',
          });
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["MyProjects"];
      //print(data[0]);
      print(data.toString());
      // print(jsonData);
      return data;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e.toString());
    }
  }
}
