import 'package:flutter/material.dart';
import 'package:gps_selling/orderMenu/orderData.dart';
import 'package:im_stepper/stepper.dart';
import 'package:intl/intl.dart';

class OrderDetailPart extends StatefulWidget {
  @override
  _OrderDetailPartState createState() => _OrderDetailPartState();
}

class _OrderDetailPartState extends State<OrderDetailPart> {
  bool firstLoad = false;
  OrderDetail showingData;
  Future<dynamic> loadingStatus() async {
    if (!firstLoad) {
      firstLoad = true;
      showingData = OrderDetail(
          orderId: "DTC000000001",
          status: 1,
          orderTime: DateTime.now(),
          fullname: "สำกฤษ ชาบุญการันต์",
          tel: "06722332343",
          email: "xxxx@mail.com",
          amount: 1,
          orderName: "BlueBox",
          reason: "ลูกค้ายกเลิก");
      return await Future.delayed(const Duration(seconds: 3), () => true);
    } else {
      return await Future.delayed(const Duration(seconds: 1), () => true);
    }
  }

  final f = new DateFormat('yyyy-MM-dd HH:mm');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: loadingStatus(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'There was an error :(',
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData ||
              snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: EdgeInsets.all(checkscreenwidth(screenWidth, 55)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: checkscreenwidth(screenWidth, 55)),
                      child: Text(
                        "ผลการค้นหา",
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 22),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                          TextSpan(
                            text: "เลขออเดอร์ :",
                            style: TextStyle(
                              fontSize: checkscreenwidth(screenWidth, 36.67),
                            ),
                            children: [
                              TextSpan(
                                text: " ${showingData.orderId}",
                                style: TextStyle(
                                  color: Color(0xFF00AEF0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text.rich(
                          TextSpan(
                            text: "กำหนดติดตั้งภายใน :",
                            style: TextStyle(
                              fontSize: checkscreenwidth(screenWidth, 36.67),
                            ),
                            children: [
                              TextSpan(
                                text: " ${f.format(showingData.orderTime)}",
                                style: TextStyle(
                                  color: Color(0xFF00AEF0),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: checkscreenwidth(screenWidth, 44),
                  ),
                  NumberStepper(
                    numbers: [1, 2, 3, 4, 5],
                    // เทสเปลี่ยนสถาณะ
                    steppingEnabled: false,
                    enableNextPreviousButtons: false,
                    enableStepTapping: false,
                    activeStepColor: showingData.statusColor(),
                    // onStepReached: (values) {
                    //   setState(() {
                    //     print(values);
                    //     showingData.status = values;
                    //   });
                    // },
                    activeStep: showingData.status,
                    stepRadius: checkscreenwidth(screenWidth, 31.42),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: checkscreenwidth(screenWidth, 55),
                    ),
                    child: Image.asset(
                      "assets/images/noimg.png",
                      width: checkscreenwidth(screenWidth, 5.5),
                      height: checkscreenwidth(screenWidth, 5.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: checkscreenwidth(screenWidth, 55),
                    ),
                    child: Text(
                      "สถานะ: ${showingData.statusText()}",
                      style: TextStyle(
                        color: showingData.statusColor(),
                        fontSize: checkscreenwidth(screenWidth, 27.5),
                      ),
                    ),
                  ),
                  // Order detail Information
                  Container(
                    child: Text(
                      "ชื่อ: ${showingData.getHideName()}",
                      style: TextStyle(
                        color: Color(0xFF00001A),
                        fontSize: checkscreenwidth(screenWidth, 44),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      "ชื่อสินค้า:${showingData.orderName} (จำนวน ${showingData.amount})",
                      style: TextStyle(
                        color: Color(0xFF00001A),
                        fontSize: checkscreenwidth(screenWidth, 44),
                      ),
                    ),
                  ),
                  if (showingData.status == 0)
                    Container(
                      child: Text(
                        "สาเหตุการยกเลิก : ${showingData.reason}",
                        style: TextStyle(
                          color: Color(0xFF00001A),
                          fontSize: checkscreenwidth(screenWidth, 44),
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
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
