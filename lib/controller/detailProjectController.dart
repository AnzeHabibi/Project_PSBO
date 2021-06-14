import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
          .get("https://mamen-lancer.herokuapp.com/api/project/$id", headers: {
        'Authorization': 'Bearer $token',
      });
      var map = json.decode(response.body);
      // List<dynamic> data = map["project"];
      // print(map);
      return map;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }
}
