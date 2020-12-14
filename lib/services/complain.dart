import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:society_resident/home_screens/complain_management_screen.dart';

class ComplainServices {
  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };
  final BASE_URL = 'http://192.168.1.109:5000/api/v1';
  Future getComaplains() async {
    final path = '$BASE_URL/complains';
    print(_headers);
    var response;

    try {
      print("Get API CALLED $path");
      response = await http.get(path, headers: _headers);

      complains = json.decode(response.body)['data'];
      print(complains);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return complains;
      }
    } catch (err) {
      Fluttertoast.showToast(
        msg: "allow",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


}
