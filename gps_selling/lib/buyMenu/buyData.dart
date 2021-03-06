import 'package:flutter/material.dart';
import 'package:gps_selling/buyMenu/buyModel.dart';
import 'package:gps_selling/homeMenu/homeData.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/services/api.dart';

import '../locator.dart';
import '../services/navigation_service.dart';

final _api = locator<Api>();

List<dynamic> provinceList = [];
List<dynamic> amphurList = [];
List<dynamic> tambonList = [];
Map<String, dynamic> initUserData;

InputDecoration formBorder(double screenWidth) => InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
          vertical: checkscreenwidth(screenWidth, 55),
          horizontal: checkscreenwidth(screenWidth, 55)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF49ADEA), width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF464646), width: 1.0),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 1.0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFD5D5D5), width: 1.0),
      ),
    );

double radioHeight(double screenWidth) {
  double temp = checkscreenwidth(screenWidth, 13.74);
  if (temp < 40) {
    return 40;
  }
  return temp;
}

Future getInitData(double amount) async {
  try {
    if (initUserData == null) {
      var temp = await _api.getUserData();
      if (temp is String) {
        locator<NavigationService>().goBack();
      } else {
        temp['amount'] = amount;
        initUserData = temp;
      }
    }
    if (provinceList.length == 0) {
      provinceList = await _api.getProvinceData();
    }
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future onProvinceChange(values) async {
  try {
    amphurList = await _api.getSpecificLocation(province: values);
    return true;
  } catch (e) {
    return false;
  }
}

Future onAmphurChange(values, amphur) async {
  try {
    tambonList =
        await _api.getSpecificLocation(province: values, amphur: amphur);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<dynamic> onTambonChange(province, amphur, tambon) async {
  try {
    var postcode = await _api.getSpecificLocation(
        province: province, amphur: amphur, tambon: tambon);
    return postcode.toString();
  } catch (e) {
    print(e);
    return "";
  }
}

Future<dynamic> confirmOrderProcess(Map<String, dynamic> data) async {
  BuyData bodyData = BuyData.fromJson(data);
  var result = await _api.sendConfirmOrder(bodyData);
  return result;
}
