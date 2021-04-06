import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:gps_selling/services/fb_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Api {
  AccessToken accessToken;

  static const String _apiEndpoint = 'http://localhost:3002';

  Future<dynamic> getUserData() async {
    try {
      accessToken = await FacebookAuth.instance.accessToken;
      print(accessToken.token);
      if (accessToken != null) {
        if (accessToken.isExpired) {
          bool checkLogin = await fbLoginCheck();
          if (!checkLogin) return !checkLogin;
        }
        final fbdata = await FacebookAuth.instance.getUserData();
        FbData userData = FbData.fromJson(fbdata);
        print("User ID : ${userData.id} , email : ${userData.email}");
      }
    } catch (e) {
      return "can't get user data";
    }
  }

  Future<bool> fbLoginCheck() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        // you are logged
        final fbdata = await FacebookAuth.instance
            .getUserData(fields: "name,email,picture.width(200),id");
        accessToken = result.accessToken;
        FbData userData = FbData.fromJson(fbdata);
        print("User ID : ${userData.id} , email : ${userData.email}");
        var saveResult = await http.post("$_apiEndpoint/check_fb_data",body: fbdata);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
