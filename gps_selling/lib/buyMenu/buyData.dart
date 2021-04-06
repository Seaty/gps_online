import 'package:flutter/material.dart';
import 'package:gps_selling/homeMenu/homeData.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/services/api.dart';

final _api = locator<Api>();

List<String> provinceList = ["กรุงเทพมหานคร", "สมุทรปราการ"];
List<String> amphurList = ["เมือง", "บางนา", "พระโขนง"];
List<String> tambonList = ["เทพารักษ์", "บางนาเหนือ", "คลองตัน"];

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

Future getInitData() async{
  var data = await _api.getUserData();
  print(data);
  return data;
}
