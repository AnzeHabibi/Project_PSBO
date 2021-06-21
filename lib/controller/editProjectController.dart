import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class EditProjectController extends State<EditProject> {
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

  editProject(
    String id,
    String titleProject,
    String caption,
    String startDate,
    String endDate,
    List<dynamic> oldPhoto,
    List<File> newPhoto,
  ) async {
    try {
      print(startDate + '=' + endDate + titleProject);
      //create multipart request for POST or PATCH method
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      Map data = {
        'title': titleProject,
        'description': caption,
        'endDate': endDate,
        'startDate': startDate
      };
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      var response = await http.put(
          "http://13.229.135.254:3001/api/project/$id",
          body: data,
          headers: headers);

      print(response.body);
      if (response.statusCode != 200) throw (response.body);
      editPhotoProject(id, oldPhoto, newPhoto);
    } catch (e) {
      print(e);
      setState(() {
        isLoadingFalse();
      });
    }
  }

  editPhotoProject(
    String id,
    List<dynamic> oldPhoto,
    List<File> newPhoto,
  ) async {
    try {
      //create multipart request for POST or PATCH method
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var request = http.MultipartRequest("PUT",
          Uri.parse("http://13.229.135.254:3001/api/project/updatePhotos/$id"));
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {
        "Content-type": "multipart/form-data",
        "Authorization": "Bearer $token"
      };
      request.headers.addAll(headers);
      String json = jsonEncode(oldPhoto);
      json = json.replaceAll('http://13.229.135.254:3001/static', '');
      request.fields['data'] = json.toString();
      newPhoto
          .map((e) async => request.files.add(await http.MultipartFile.fromPath(
                "photos",
                e.path,
                contentType: MediaType('image', 'jpeg'),
              )))
          .toList();
      print("request: " + request.fields.toString());
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      if (response.statusCode != 200) throw (responseString);
      print(responseString);
      setState(() {
        isLoadingFalse();
        print(id);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => DetailPage(
                    id: id,
                  )),
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

  deleteProject(
    String id,
  ) async {
    try {
      //create multipart request for POST or PATCH method
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      var request = http.MultipartRequest(
          "DELETE", Uri.parse("http://13.229.135.254:3001/api/project/$id"));
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      request.headers.addAll(headers);
      print("request: " + request.fields.toString());
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      if (response.statusCode != 200) throw (responseString);
      print(responseString);
      setState(() {
        isLoadingFalse();
        print(id);
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
