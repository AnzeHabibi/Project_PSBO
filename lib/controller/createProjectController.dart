import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    List<File> photo,
  ) async {
    try {
      print(startDate + '=' + endDate);
      //create multipart request for POST or PATCH method
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var request = http.MultipartRequest(
          "POST", Uri.parse("http://13.229.135.254:3001/api/project/"));
      //add text fields
      //print("photo2");
      request.fields['title'] = titleProject;
      request.fields['description'] = caption;
      request.fields['endDate'] = endDate;
      request.fields['startDate'] = startDate;
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {
        "Content-type": "*/*",
        "Authorization": "Bearer $token"
      };
      request.headers.addAll(headers);
      photo
          .map((e) async => request.files.add(await http.MultipartFile.fromPath(
                "photos",
                e.path,
                contentType: MediaType('image', 'jpeg'),
              )))
          .toList();

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
