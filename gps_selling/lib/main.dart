import 'package:flutter/material.dart';
import 'package:gps_selling/buyMenu/buymain.dart';
import 'package:gps_selling/historyMenu/historyMain.dart';
import 'package:gps_selling/homeMenu/home_screen.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/orderMenu/orderCheckingPage.dart';
import 'package:gps_selling/orderMenu/orderConfirmPage.dart';
import 'package:gps_selling/pages/notfound.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/navigation_service.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

void main() {
  if (kIsWeb) {
    // initialiaze the facebook javascript SDK
    FacebookAuth.instance.webInitialize(
      appId: "126089046149815", //<-- YOUR APP_ID
      cookie: true,
      xfbml: true,
      version: "v9.0",
    );
  }
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final bool show404 = false;

  @override
  void initState() {
    super.initState();
  }

  bool onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }
    //update state when pop page
    this.setState(() {});
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPS selling website',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Kanit'),
      builder: (context, child) => child,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: HomeRoute,
      routes: {
        '/buyinfo': (context) => BuyMainPage(),
        '/home': (context) => HomeScreenPage(),
        '/confirm': (context) => OrderConfirmPage(),
        '/checking': (context) => OrderCheckMainPage(),
        '/history': (context) => HistoryMainPage()
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => NotfoundPage());
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
