import 'dart:convert';
import 'dart:wasm';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:society_resident/constants/global_variables.dart';

class MoneyPoolServices {
  Map<String, String> _headers = {
    "Content-Type": "application/json",
  };
  final URL = '$BASE_URL/api/v1/moneypool';
  Future updateContributors(money) async{
    print("MONEY");
    print(money);
  final path = 'http://192.168.100.134:5000/api/v1/moneypool/contributors';
    Map jsonBody = {
      "name":user.name,
      "contributedMoney":money,
    };
    print(jsonBody);
    print(_headers);
    var response;
    var respondedMap;
    try {
      print("POst API CALLED $path");
      response = await http.post(path,
          headers: _headers,
          body: json.encode(jsonBody),
          encoding: Encoding.getByName("utf-8"));
      respondedMap = json.decode(response.body);
      print("HELLO THIS IS MONEYPOOL");
      print(respondedMap);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return respondedMap;
      } else {
        return respondedMap;
      }
    } catch (err) {
      Fluttertoast.showToast(
//        msg: respondedMap?.body['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
  Future updateMoneyPool()async
  {
    Map jsonBody = {
      "currentMoney":moneypool.currentMoney,
      "earnedMoney": moneypool.totalEarnedMoney,
      "spendMoney": moneypool.spendMoney,
    };
    print(jsonBody);
    print(_headers);
    var response;
    var respondedMap;
    try {
      print("POst API CALLED $URL");
      response = await http.post(URL,
          headers: _headers,
          body: json.encode(jsonBody),
          encoding: Encoding.getByName("utf-8"));
      print(response);
      respondedMap = json.decode(response.body);
      print("HELLO THIS IS MONEYPOOL");
      print(respondedMap);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return respondedMap;
      } else {
        return respondedMap;
      }
    } catch (err) {
      Fluttertoast.showToast(
        msg: respondedMap?.body['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
  Future getMoneyPool()async
  {
    print(_headers);
    var response;
    var respondedMap;
    try {
      print("Get API CALLED $URL");
      response = await http.get(URL,
          headers: _headers);
      print(response);
      respondedMap = json.decode(response.body);
      print("HELLO THIS IS MONEYPOOL");
      print(respondedMap['data'][0]);
      moneypool.currentMoney = respondedMap['data'][0]["currentMoney"]??0.0;

      print(respondedMap['data'][0]['contributors']);
      moneypool.contributors = respondedMap['data'][0]['contributors'];
      moneypool.contributors.removeAt(0);
      moneypool.spendMoney = respondedMap['data'][0]["spendMoney"] ;
      moneypool.totalEarnedMoney =respondedMap['data'][0]["earnedMoney"];

      print(moneypool.contributors);


      if (response.statusCode == 200 || response.statusCode == 201) {
        return respondedMap;
      } else {
        return respondedMap;
      }
    } catch (err) {
      Fluttertoast.showToast(
//        msg: respondedMap?.body['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
//  Future<Map<String, dynamic>> updateCurrentMoney(currentMoney) async {
//    final path = '$URL/currentmoney';
//    print(currentMoney);
//    Map jsonBody = {"currentMoney": currentMoney};
//    print(jsonBody);
//    print(_headers);
//    var response;
//    var respondedMap;
//    try {
//      print("PUT API CALLED $path");
//      response = await http.put(path,
//          headers: _headers,
//          body: json.encode(jsonBody),
//          encoding: Encoding.getByName("utf-8"));
//      print(response);
//      respondedMap = json.decode(response.body);
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        return respondedMap;
//      } else {
//        return respondedMap;
//      }
//    } catch (err) {
//      Fluttertoast.showToast(
//        msg: respondedMap?.body['msg'],
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.BOTTOM,
//        backgroundColor: Colors.red,
//        textColor: Colors.white,
//        fontSize: 16.0,
//      );
//    }
//  }
//
//    Future<Map<String, dynamic>> updateSpendMoney(spendMoney) async {
//    final path = '$URL/spendmoney';
//    print(spendMoney);
//    Map jsonBody = {"spendMoney": spendMoney};
//    print(jsonBody);
//    print(_headers);
//    var response;
//    var respondedMap;
//    try {
//      print("Spend money");
//      print("PUT API CALLED $path");
//      response = await http.put(path,
//          headers: _headers,
//          body: json.encode(jsonBody),
//          encoding: Encoding.getByName("utf-8"));
//      print(response);
//      respondedMap = json.decode(response.body);
//      if (response.statusCode == 200 || response.statusCode == 201) {
//        return respondedMap;
//      } else {
//        return respondedMap;
//      }
//    } catch (err) {
//      Fluttertoast.showToast(
//        msg: respondedMap?.body['msg'],
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.BOTTOM,
//        backgroundColor: Colors.red,
//        textColor: Colors.white,
//        fontSize: 16.0,
//      );
//    }
//  }


}
