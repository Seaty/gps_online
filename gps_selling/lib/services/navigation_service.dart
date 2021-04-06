import 'package:flutter/material.dart';
import 'package:gps_selling/historyMenu/historyModel.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName,
      {Map<String, String> queryParams, HistoryData historydata}) {
    if (queryParams != null) {
      routeName = Uri(path: routeName, queryParameters: queryParams).toString();
    }

    return navigatorKey.currentState
        .pushNamed(routeName, arguments: historydata);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}
