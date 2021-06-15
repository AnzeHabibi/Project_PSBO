import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

abstract class ShowProfileController extends State<MyProfilePage> {
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

  String name;
  String mail;
  String specialist;
  String whatsapp;
  String instagram;
  String photo;

  ShowProfileController(
      {this.name,
      this.mail,
      this.specialist,
      this.whatsapp,
      this.instagram,
      this.photo});

  getMyProfile() async {
    setState(() {
      isLoadingTrue();
    });
    //var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('token');
    try {
      var response = await http
          .get("https://mamen-lancer.herokuapp.com/api/user/auth", headers: {
        'Authorization': 'Bearer $token',
      });
      var map = json.decode(response.body);
      print("aaaasv" + map.toString());
      // name = map['name'];
      //print(name);
      //print(data.toString());
      // print(jsonData);
      return map;
      //name = map['name'];
      //mail = map['email'];
      //specialist = map['specialist']; blm ada di api
      //photo = map['photo'];
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }
}
