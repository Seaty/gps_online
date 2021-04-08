import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gps_selling/buyMenu/buymain.dart';
import 'package:gps_selling/historyMenu/historyDetail.dart';
import 'package:gps_selling/historyMenu/historyMain.dart';
import 'package:gps_selling/homeMenu/home_screen.dart';
import 'package:gps_selling/homeMenu/home_video.dart';
import 'package:gps_selling/orderMenu/orderCheckingPage.dart';
import 'package:gps_selling/orderMenu/orderConfirmPage.dart';
import 'package:gps_selling/pages/notfound.dart';

const String HomeRoute = "/home";
const String LoginRoute = "/login";
const String BuyInfoRoute = "/buyinfo";
const String VideoRoute = "/video";
const String ConfirmOrderRoute = "/confirm";
const String OrderCheckMainRoute = "/checking";
const String HistoryMainRoute = "/history";
const String HistoryDetailRoute = "/detail";

Route<dynamic> generateRoute(RouteSettings setting) {
  // var routingData = setting.name.getRoutingData;

  switch (setting.name) {
    case HomeRoute:
      return _getPageRoute(HomeScreenPage(), setting);
    case LoginRoute:
      return _getPageRoute(HomeScreenPage(), setting);
    case BuyInfoRoute:
      return _getPageRoute(BuyMainPage(), setting);
    case VideoRoute:
      return _getPageRoute(VideoApp(), setting);
    case ConfirmOrderRoute:
      return _getPageRoute(OrderConfirmPage(), setting);
    case OrderCheckMainRoute:
      return _getPageRoute(OrderCheckMainPage(), setting);
    case HistoryMainRoute:
      return _getPageRoute(HistoryMainPage(), setting);
    case HistoryDetailRoute:
      return _getPageRoute(
          HistoryDetailPage(getData: setting.arguments), setting);
    default:
      return _getPageRoute(NotfoundPage(), setting);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child,setting:settings);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final RouteSettings setting;
  _FadeRoute({this.child, this.setting})
      : super(
          settings:
              RouteSettings(name: setting.name, arguments: setting.arguments),
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              child,
          transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
