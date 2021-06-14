import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

abstract class CreateProjectController extends State<UploadPost> {
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

  createProject(
      String titleProject,
      String caption,
      String startDate,
      String endDate,
      File photo,
      ) async {
    try {
      //create multipart request for POST or PATCH method
      var request = http.MultipartRequest(
          "POST", Uri.parse("https://mamen-lancer.herokuapp.com/api/project/"));
      //add text fields
      //print("photo2");
      request.fields['title'] = titleProject;
      request.fields['description'] = caption;
      request.fields['endDate'] = endDate;
      request.fields['startDate'] = startDate;
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {"Content-type": "multipart/form-data"};
      var pic = await http.MultipartFile.fromPath(
        "photo",
        photo.path,
        contentType: MediaType('image', 'jpeg'),
      );
      pic = await http.MultipartFile.fromPath(
        "photo",
        photo.path,
        contentType: MediaType('image', 'png'),
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
          MaterialPageRoute(builder: (context) => MainPage()),
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
