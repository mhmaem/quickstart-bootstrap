import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:bootstrap/apis/APICaller.dart';
import 'package:bootstrap/apis/APIConstants.dart';
import 'package:bootstrap/apis/APIRequestType.dart';
import 'package:bootstrap/utils/SharedPreferencesManager.dart';

class APIDirectory {
  /*
  static registerUser() {
    APICaller.callAPI(
        username: "user",
        password: "user",
        apiType: "usersAPI",
        apiRequestType: APIRequestType.post,
        requestBody: {"password": "password", "username": "username"});
  }
   */

  static Future<String> loginUser(
      {@required String username, @required String password}) async {
    http.Response response = await APICaller.callAPI(
        apiType: APIConstants.loginAPI,
        apiRequestType: APIRequestType.post,
        requestBody: {
          "username": username,
          "password": password,
        });
    if (response.statusCode != 200) {
      return "Bad Username or Password!";
    } else {
      SharedPreferencesManager.setSharedPreference(
          sharedPreferenceKey: "susername", sharedPreferenceValue: username);
      SharedPreferencesManager.setSharedPreference(
          sharedPreferenceKey: "spassword", sharedPreferenceValue: password);
      SharedPreferencesManager.setSharedPreference(
          sharedPreferenceKey: "dcurrentbalance",
          sharedPreferenceValue: double.tryParse(
              jsonDecode(response.body)['currentBalance'].toString()));
    }
    return null;
  }

  static Future<String> signupUser(
      {@required String username, @required String password}) async {
    http.Response response = await APICaller.callAPI(
        apiType: APIConstants.signupAPI,
        apiRequestType: APIRequestType.post,
        requestBody: {
          "username": username,
          "password": password,
        });
    if (response.statusCode != 200) {
      return "Bad Username or Password!";
    } else {
      SharedPreferencesManager.setSharedPreference(
          sharedPreferenceKey: "susername", sharedPreferenceValue: username);
      SharedPreferencesManager.setSharedPreference(
          sharedPreferenceKey: "spassword", sharedPreferenceValue: password);
    }
    return null;
  }

  static Future<String> updateUserDeviceToken(
      {@required String username,
      @required String password,
      @required String deviceToken}) async {
    http.Response response = await APICaller.callAPI(
        username: username,
        password: password,
        apiType: APIConstants.updateUserDeviceTokenAPI,
        apiRequestType: APIRequestType.post,
        requestBody: {
          "userDeviceToken": deviceToken,
        });
    if (response.statusCode != 200) {
      print("Device Token Not Updated");
    } else {
      print("Device Token Updated");
    }
    return null;
  }

  static Future<String> loadPoints(
      {@required String username,
      @required String password,
      @required bool issued}) async {
    http.Response response = await APICaller.callAPI(
        username: username,
        password: password,
        apiType: (issued)
            ? APIConstants.listIssuedPointsAPI
            : APIConstants.listRedeemedPointsAPI,
        apiRequestType: APIRequestType.post,
        requestBody: {});
    if (response.statusCode != 200) {
      print("Could not load points");
      return null;
    } else {
      return response.body;
    }
    //return null;
  }
}

//get example
/*
    APICaller.postRequest(
      apiType: "usersAPI",
      apiRequestType: APIRequestType.get,
    );
    */
