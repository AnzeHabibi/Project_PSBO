import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';

abstract class LoginController extends State<SignInPage> {
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

  signIn(String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      setState(() {
        isLoadingTrue();
      });
      var response = await http
          .post("http://13.229.135.254:3001/api/user/loginIPB", body: data);
      jsonData = json.decode(response.body);
      print(jsonData.toString());
      setState(() {
        isLoadingFalse();
        sharedPreferences.setString("token", jsonData['token']);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MainPage(),
          ),
        );
      });
    } catch (e) {
      setState(() {
        isLoadingFalse();
      });
      print(e);
    }
  }
}
