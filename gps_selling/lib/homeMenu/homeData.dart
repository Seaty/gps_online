import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/api.dart';
import 'package:gps_selling/services/navigation_service.dart';

final _api = locator<Api>();

List<String> slideImg = ["GPS-Blue-Box-2-01.jpg", "GPS-Blue-Box-2-02.jpg"];
double checkscreenwidth(double meidawidth, double multiply) {
  if (meidawidth > 1100) {
    meidawidth = 1100;
  }
  return meidawidth / multiply;
}

Widget svgLogo(screenWidth, assetName, {color = const Color(0xFF00AEF0)}) =>
    SvgPicture.asset(assetName,
        width: screenWidth, color: color, semanticsLabel: 'GiftBoxLogo');
double basePrice = 4500;

double snackBarHeight(double screenWidth, double screenHeight) {
  if (screenWidth < 426) {
    return screenHeight / 3.8;
  } else if (screenWidth < 940) {
    return screenHeight / 2.3;
  } else {
    return screenHeight / 2;
  }
}

// Call Api
Future fbCheck() async {
  var fbResult = await _api.fbLoginCheck();
  if (fbResult) {
    locator<NavigationService>().navigateTo(BuyInfoRoute);
    return true;
  } else {
    return "failed";
  }
}
