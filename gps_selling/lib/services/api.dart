import 'package:gps_selling/buyMenu/buyModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:gps_selling/services/fb_model.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:query_params/query_params.dart';

class Api {
  AccessToken accessToken;

  static const String _apiEndpoint = 'http://localhost:3002';

  Future<dynamic> getUserData() async {
    try {
      accessToken = await FacebookAuth.instance.accessToken;
      if (accessToken != null) {
        if (accessToken.isExpired) {
          bool checkLogin = await fbLoginCheck();
          if (!checkLogin) return !checkLogin;
        }
        final fbdata = await FacebookAuth.instance.getUserData();
        FbData userData = FbData.fromJson(fbdata);
        var response =
            await http.get("$_apiEndpoint/get_user_data?id=${userData.id}");
        if (response.statusCode == 200) {
          var dbData = convert.jsonDecode(response.body);
          return dbData;
        }
        return "can't get user data";
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
        var saveResult = await http.post("$_apiEndpoint/check_fb_data", body: {
          "id": userData.id,
          "email": userData.email,
          "fb_name": userData.name
        });
        print(saveResult);
        return true;
      }
      return false;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List> getProvinceData() async {
    try {
      var response = await http.get("$_apiEndpoint/get_location_check");
      if (response.statusCode == 200) {
        List<dynamic> provinceList = convert.jsonDecode(response.body);
        return provinceList;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<dynamic> getSpecificLocation(
      {String province, String amphur, String tambon}) async {
    try {
      URLQueryParams queryParams = new URLQueryParams();
      if (province != null) queryParams.append("province", province);
      if (amphur != null) queryParams.append("amphur", amphur);
      if (tambon != null) queryParams.append("tambon", tambon);
      var response =
          await http.get("$_apiEndpoint/get_location_check?$queryParams");
      if (response.statusCode == 200) {
        var locationList = convert.jsonDecode(response.body);
        return locationList;
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<dynamic> sendConfirmOrder(BuyData data) async {
    try {
      http.MultipartFile slipFile = http.MultipartFile.fromBytes(
        'slipimage',
        data.slipImage,
        filename: 'slipfile.png',
      );
      var request = new http.MultipartRequest(
        "POST",
        Uri.parse("$_apiEndpoint/createNewOrder"),
      )
        ..fields['data'] = buyDataToBodyJson(data)
        ..files.add(slipFile);

      if (data.chassisImage != null) {
        http.MultipartFile chassisFile = http.MultipartFile.fromBytes(
          'chassisimage',
          data.chassisImage,
          filename: 'chassisfile.png',
        );
        request.files.add(chassisFile);
      }
      var response = await http.Response.fromStream(await request.send());
      if (response.statusCode == 200) {
        return response.body;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
