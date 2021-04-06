import 'package:flutter/material.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/orderMenu/orderData.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/navigation_service.dart';

class OrderConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(minWidth: 320, maxWidth: 800),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: checkscreenwidth(screenWidth, 7.333),
                color: Color(0xFF4CAF50),
              ),
              Text(
                "ยืนยันการสั่งซื้อเรียบร้อย",
                style: TextStyle(
                    color: Color(0xFF00AEF0),
                    fontSize: checkscreenwidth(screenWidth, 22),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: checkscreenwidth(screenWidth, 55),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "หมายเลขคำสั่งซื้อ :",
                          style: TextStyle(
                            color: Color(0xFF464646),
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "DTC0092503",
                      style: TextStyle(
                        color: Color(0xFF00AEF0),
                        fontSize: checkscreenwidth(screenWidth, 36.67),
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 30),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "เวลาที่สั่งซื้อ :",
                          style: TextStyle(
                            color: Color(0xFF464646),
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "30-04-2020 10:20",
                      style: TextStyle(
                        color: Color(0xFF00AEF0),
                        fontSize: checkscreenwidth(screenWidth, 36.67),
                      ),
                    ),
                  )),
                ],
              ),
              Text(
                "เราได้รับข้อมูลของท่านแล้ว เจ้าหน้าที่จะติดต่อท่านโดยเร็วที่สุด",
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: checkscreenwidth(screenWidth, 36.67),
                ),
              ),
              Text(
                "หลักฐานการสั่งซื้อจะส่งถูกไปยังอีเมลล์ของท่าน",
                style: TextStyle(
                  color: Color(0xFF464646),
                  fontSize: checkscreenwidth(screenWidth, 36.67),
                ),
              ),
              SizedBox(
                height: checkscreenwidth(screenWidth, 27.5),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                      horizontal: checkscreenwidth(screenWidth, 19.642),
                      vertical: checkscreenwidth(screenWidth, 55),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.resolveWith(borderBgColorState),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xFF00AEF0),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  locator<NavigationService>().navigateTo(HomeRoute);
                },
                child: Text(
                  "ไปหน้าแรก",
                  style: TextStyle(
                    color: Color(0xFF00AEF0),
                    fontSize: checkscreenwidth(screenWidth, 36.67),
                  ),
                ),
              ),
              SizedBox(
                height: checkscreenwidth(screenWidth, 27.5),
              ),
              Text.rich(
                TextSpan(
                  text: "*หมายเหตุ",
                  style: TextStyle(
                      fontSize: checkscreenwidth(screenWidth, 55),
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF464646)),
                  children: [
                    TextSpan(
                      text:
                          " หากคุณมีคำถามใดๆ หลังจากการสั่งสินค้า โปรดติดต่อฝ่ายบริการลูกค้าออนไลน์ ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "โทร. ",
                  style: TextStyle(
                    fontSize: checkscreenwidth(screenWidth, 55),
                    color: Color(0xFF464646),
                  ),
                  children: [
                    TextSpan(
                      text: " 096-907-8592  หรือ online@dtc.co.th ",
                      style: TextStyle(
                        fontSize: checkscreenwidth(screenWidth, 55),
                        color: Color(0xFF00AEF0),
                      ),
                    ),
                    TextSpan(
                      text:
                          " โปรดแจ้งชื่อของคุณ ข้อมูลการสั่งซื้อ เบอร์ติดต่อกลับ ",
                    ),
                  ],
                ),
              ),
              Text(
                "พนักงานบริการลูกค้าของเราจะจัดการให้คุณอย่างรวดเร็ว",
                style: TextStyle(
                  fontSize: checkscreenwidth(screenWidth, 55),
                  color: Color(0xFF464646),
                ),
              )
            ], //
          ),
        ),
      ),
    );
  }
}
