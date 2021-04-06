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
// ignore: missing_return
Route<dynamic> generateRoute(RouteSettings setting) {
  // var routingData = setting.name.getRoutingData;
  switch (setting.name) {
    case HomeRoute:
      return _getPageRoute(HomeScreenPage());
    case LoginRoute:
      return _getPageRoute(HomeScreenPage());
    case BuyInfoRoute:
      return _getPageRoute(BuyMainPage());
    case VideoRoute:
      return _getPageRoute(VideoApp());
    case ConfirmOrderRoute:
      return _getPageRoute(OrderConfirmPage());
    case OrderCheckMainRoute:
      return _getPageRoute(OrderCheckMainPage());
    case HistoryMainRoute:
      return _getPageRoute(HistoryMainPage());
    case HistoryDetailRoute:
      return _getPageRoute(HistoryDetailPage(getData: setting.arguments));
    default:
      return _getPageRoute(NotfoundPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return _FadeRoute(child: child);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({this.child})
      : super(
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
