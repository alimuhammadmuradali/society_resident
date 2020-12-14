import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:society_resident/detail_screen/guards_detail.dart';
import 'package:society_resident/detail_screen/sweeper_detail.dart';

class WorkerServices {
  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };
  final BASE_URL = 'http://192.168.100.134:5000/api/v1/workers';
  Future getGuards(type) async {
    final path = '$BASE_URL';
    print(_headers);
    var response;

    Map jsonbody = {"type": type};
    try {
      print("Post API CALLED $path");
      response = await http.post(
          path ,
          body: json.encode(jsonbody),
          headers: _headers ,
          encoding: Encoding.getByName("utf-8")
      );

      guards = json.decode(response.body)['data'];
      print(guards);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }else
      {
        return false;
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
  Future getSweeper(type) async {
    final path = '$BASE_URL';
    print(_headers);
    var response;

    Map jsonbody = {"type": type};
    try {
      print("Post API CALLED $path");
      response = await http.post(
          path ,
          body: json.encode(jsonbody),
          headers: _headers ,
          encoding: Encoding.getByName("utf-8")
      );

      sweepers = json.decode(response.body)['data'];
      print(guards);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }else
      {
        return false;
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
