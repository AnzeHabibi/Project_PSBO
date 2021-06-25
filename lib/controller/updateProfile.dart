import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_psbo/ui/pages/pages.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UpdateProfileController extends State<SignUpPage> {
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

  editProfile(
      String nama,
      String email,
      String phone,
      String specialist,
      String linkedin,
      String whatsapp,
      String instagram,
      File image,
      PlatformFile cv) async {
    try {
      setState(() {
        isLoadingTrue();
      });
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      Map data = {
        'name': nama,
        'email': email,
        'phoneNumber': phone,
        'speciality': specialist,
        'linkedin': linkedin,
        'whatsapp': whatsapp,
        'instagram': instagram
      };
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      var response = await http.put("http://13.229.135.254:3001/api/user",
          body: data, headers: headers);
      print(response.body);
      setState(() {
        isLoadingFalse();
      });
      if (response.statusCode != 200) throw (response.body);

      if (image != null) {
        editPhotoProfil(image, cv);
      }
      if (cv != null) {
        editCVProfil(cv);
      } else {
        setState(() {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyProfilePage()),
            (Route<dynamic> route) => false,
          );
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        isLoadingFalse();
      });
    }
  }

  editPhotoProfil(
    File photo,
    PlatformFile cv,
  ) async {
    try {
      print("masuk poto");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      //create multipart request for POST or PATCH method
      var request = http.MultipartRequest(
          "PUT", Uri.parse("http://13.229.135.254:3001/api/user/updatePhoto"));
      //add text fields
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {"Authorization": "Bearer $token"};
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
        if (cv != null) {
          editCVProfil(cv);
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyProfilePage()),
            (Route<dynamic> route) => false,
          );
        }
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoadingFalse();
      });
    }
  }

  editCVProfil(
    PlatformFile cv,
  ) async {
    try {
      print("masuk cv");
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      var token = sharedPreferences.getString('token');
      //create multipart request for POST or PATCH method
      var request = http.MultipartRequest(
          "PUT", Uri.parse("http://13.229.135.254:3001/api/user/updateCV"));
      //add text fields
      //create multipart using filepath, string or bytes
      Map<String, String> headers = {"Authorization": "Bearer $token"};
      var CV = await http.MultipartFile.fromPath(
        "cv",
        cv.path,
        contentType: MediaType('application', 'pdf'),
      );
      request.headers.addAll(headers);
      //add multipart to request
      request.files.add(CV);
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
          MaterialPageRoute(builder: (context) => MyProfilePage()),
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
