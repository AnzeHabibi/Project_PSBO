import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

abstract class SignUpController extends State<SignUnPage2> {
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

  signUp(
    String email,
    String name,
    String password,
    String phone,
    String specialist,
    File photo,
    String linkedin,
    String whatsapp,
    String instagram,
  ) async {
    try {
      //create multipart request for POST or PATCH method
      var request = http.MultipartRequest(
          "POST", Uri.parse("https://mamen-lancer.herokuapp.com/api/user/"));
      //add text fields
      print("photo2");
      request.fields['email'] = email;
      request.fields['name'] = name;
      request.fields['password'] = password;
      request.fields['phone'] = phone;
      request.fields['speciality'] = specialist;
      request.fields['linkedin'] = linkedin;
      request.fields['whatsapp'] = whatsapp;
      request.fields['instagram'] = instagram;
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      var pic = await http.MultipartFile.fromPath(
        "photo",
        photo.path,
        contentType: MediaType('image', 'jpeg'),
      );
      request.headers.addAll(headers);
      //add multipart to request
      request.files.add(pic);
      print("request: " + request.toString());

      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      if (response.statusCode != 200) throw (responseString);
      print(responseString);
      setState(() {
        isLoadingFalse();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => SignInPage()),
          (Route<dynamic> route) => false,
        );
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoadingFalse();
      });
    }
  }
}
