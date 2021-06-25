import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_psbo/model/model.dart';
//import 'package:project_psbo/model/model.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class RegistrantController extends State<RegistrantPage> {
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

  getParticipant(String id) async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response = await http
          .get("http://13.229.135.254:3001/api/projectMember/$id", headers: {
        'Authorization': 'Bearer $token',
      });
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["projectMember"];
      print("data" + data.toString());
      setState(() {
        isLoadingFalse();
      });
      return data;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }

  acceptParticipant(String id) async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      print("data");
      var response = await http
          .put("http://13.229.135.254:3001/api/projectMember/$id", headers: {
        'Authorization': 'Bearer $token',
      });
      var map = json.decode(response.body);
      print("data" + map.toString());
      setState(() {
        isLoadingFalse();
      });
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }

  getMember(String id) async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response = await http.get(
          "http://13.229.135.254:3001/api/projectMember/member/$id",
          headers: {
            'Authorization': 'Bearer $token',
          });
      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["projectMember"];
      print("data" + data.toString());
      setState(() {
        isLoadingFalse();
      });
      return data;
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }

  getProfile(String id) async {
    setState(() {
      isLoadingTrue();
    });
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      print("data");
      var response =
          await http.get("http://13.229.135.254:3001/api/user/$id", headers: {
        'Authorization': 'Bearer $token',
      });
      var map = json.decode(response.body);
      print("data" + map.toString());
      setState(() {
        isLoadingFalse();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(data: map['user'])));
      });
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }
}
