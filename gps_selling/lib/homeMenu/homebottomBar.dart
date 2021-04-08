import 'package:flutter/material.dart';
import 'package:gps_selling/homeMenu/homeData.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/navigation_service.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class HomeBottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 70,
      padding: EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: TextButton.icon(
              onPressed: () {
                locator<NavigationService>().navigateTo(OrderCheckMainRoute);
              },
              icon: Icon(
                Icons.call,
                size: checkscreenwidth(screenWidth, 18.33),
              ),
              label: Text(
                "สอบถาม",
                style: TextStyle(
                  fontSize: checkscreenwidth(screenWidth, 36.67),
                ),
              ),
              style: ButtonStyle(),
            ),
          ),
          VerticalDivider(
              width: 30,
              thickness: 1,
              indent: 5,
              endIndent: 5,
              color: Colors.grey),
          Expanded(
            flex: 2,
            child: TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15),
                    child: Image.asset(
                      "assets/images/line.png",
                      width: checkscreenwidth(screenWidth, 18.33),
                      height: checkscreenwidth(screenWidth, 18.96),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        right: 0.0, top: 2.0, bottom: 2.0, left: 10.0),
                    child: Text(
                      "Line",
                      style: TextStyle(
                        fontSize: checkscreenwidth(screenWidth, 36.67),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: ElevatedButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  expand: false,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) => SellGPSModal(),
                );
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: checkscreenwidth(screenWidth, 24),
                    ),
                    Text(
                      "สั่งซื้อทันที",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: checkscreenwidth(screenWidth, 33),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SellGPSModal extends StatefulWidget {
  @override
  _SellGPSModalState createState() => _SellGPSModalState();
}

class _SellGPSModalState extends State<SellGPSModal> {
  double amountSelect;

  @override
  void initState() {
    amountSelect = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      height: snackBarHeight(screenWidth, screenHeight),
      width: double.infinity,
      child: Column(
        children: [
          //First Row
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/GPS-Blue-Box-2-02.jpg",
                  width: checkscreenwidth(screenWidth, 7.85714),
                  height: checkscreenwidth(screenWidth, 7.85714),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "GPS TRACKING (ผ่านกรมการขนส่งทางบก)",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.close,
                            size: checkscreenwidth(screenWidth, 36.67),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        )
                      ],
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 22),
                        ),
                        text: "฿ ",
                        children: [
                          TextSpan(
                            text: (basePrice * amountSelect).toStringAsFixed(
                                2), //(basePrice * amountSelect).toString()
                            style: TextStyle(
                              color: Color(0xFF00AEF0),
                            ),
                          ),
                          WidgetSpan(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Color(0xFF00AEF0))),
                                child: Text(
                                  "โอนเงิน",
                                  style: TextStyle(
                                    fontSize: checkscreenwidth(screenWidth, 55),
                                    color: Color(0xFF00AEF0),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(
            height: 10,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          //Second Row
          Expanded(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "เลือกสินค้า",
                      style: TextStyle(
                        fontSize: checkscreenwidth(screenWidth, 36.67),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CustomRadioButton(
                      unSelectedColor: Color(0xFFF2F2F2),
                      buttonTextStyle: ButtonTextStyle(
                        selectedColor: Color(0xFF00AEF0),
                        unSelectedColor: Color(0xFF464646),
                        textStyle: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 55),
                        ),
                      ),
                      buttonLables: [1, 2, 3].map<String>((index) {
                        double total = index * basePrice;
                        return "$index ชุด ราคา ฿ $total";
                      }).toList(),
                      buttonValues: [
                        1,
                        2,
                        3,
                      ],
                      radioButtonValue: (values) {
                        setState(() {
                          amountSelect = values;
                        });
                      },
                      defaultSelected: 1,
                      horizontal: false,
                      width: checkscreenwidth(screenWidth, 3.667),
                      height: radioHeight(screenWidth),
                      selectedColor: Colors.white,
                      selectedBorderColor: Color(0xFF00AEF0),
                      unSelectedBorderColor: Colors.transparent,
                      padding: 5,
                      spacing: 10.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: checkscreenwidth(screenWidth, 55),
          ),
          //Button
          Container(
            margin: EdgeInsets.all(checkscreenwidth(screenWidth, 110)),
            child: ElevatedButton(
              onPressed: () async {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return FutureBuilder(
                          future: fbCheck(),
                          builder: (context, snapshot) {
                
                            if (snapshot.hasError) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text(snapshot.error.toString()),
                                actions: [
                                  TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text("ปิด"))
                                ],
                              );
                            } else if (ConnectionState.waiting ==
                                snapshot.connectionState) {
                              return AlertDialog(
                                title: Text("กำลังเช็ค Facebook Login"),
                                content: Container(
                                    height: 40,
                                    child: Center(
                                        child: CircularProgressIndicator())),
                              );
                            } else if (snapshot.hasData) {
                              print(snapshot.data);
                              if (snapshot.data is String) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("กรุณาล๊อคอินด้วย Facebook"),
                                  actions: [
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text("ปิด"))
                                  ],
                                );
                              }
                              return AlertDialog(
                                  title: Text("กำลังพาคุณไปหน้าต่อไป"),
                                  content: Container(
                                      height: 40,
                                      child: Center(
                                          child: CircularProgressIndicator())));
                            } else {
                              return AlertDialog(
                                  title: Text("กำลังเช็ค Facebook Login"),
                                  content: Container(
                                      height: 40,
                                      child: Center(
                                          child: CircularProgressIndicator())));
                            }
                          });
                    });
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      size: checkscreenwidth(screenWidth, 24),
                    ),
                    Text(
                      "สั่งซื้อทันที",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: checkscreenwidth(screenWidth, 33),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

double radioHeight(double screenWidth) {
  double temp = checkscreenwidth(screenWidth, 13.74);
  if (temp < 40) {
    return 40;
  }
  return temp;
}
