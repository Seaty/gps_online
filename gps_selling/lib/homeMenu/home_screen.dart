import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:gps_selling/homeMenu/expanding_card.dart';
import 'package:gps_selling/homeMenu/homeData.dart';
import 'package:gps_selling/homeMenu/home_video.dart';
import 'package:gps_selling/homeMenu/homebottomBar.dart';

class HomeScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(minWidth: 320, maxWidth: 800),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Carousel Image Slider
                  CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                    ),
                    items: slideImg.map((imagename) {
                      return Image.asset('assets/images/$imagename');
                    }).toList(),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '฿ ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: checkscreenwidth(screenWidth, 22),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '4500',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          checkscreenwidth(screenWidth, 22),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.shopping_cart,
                          color: Color(0xFF00AEF0),
                          size: 45.0,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 0,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.shield, size: 30, color: Colors.black),
                        Text(
                          "รับประกันติดตั้งภายใน 3 วัน",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: checkscreenwidth(screenWidth, 55),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 10,
                    thickness: 1,
                    indent: 0,
                    endIndent: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "GPS TRACKING พร้อมเครื่องรูดบัตร",
                        style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 22),
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "(ผ่านกรมการขนส่งทางบก)",
                        style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 22),
                            color: Colors.blue),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '“สั่งซื้อสินค้ากับเรา มั่นใจได้มาตรฐาน”',
                        style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 22),
                            color: Colors.black),
                      ),
                    ],
                  ),
                  const Divider(
                    height: 30,
                    thickness: 1,
                    indent: 0,
                    endIndent: 20,
                  ),
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '1 ชุด ราคา ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: checkscreenwidth(screenWidth, 36.37),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '฿ 4500',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          checkscreenwidth(screenWidth, 36.37),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        VerticalDivider(
                            width: 30,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey),
                        RichText(
                          text: TextSpan(
                            text: '2 ชุด ราคา ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: checkscreenwidth(screenWidth, 36.37),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '฿ 8900',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          checkscreenwidth(screenWidth, 36.37),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        VerticalDivider(
                            width: 30,
                            thickness: 1,
                            indent: 0,
                            endIndent: 0,
                            color: Colors.grey),
                        RichText(
                          text: TextSpan(
                            text: '3 ชุด ราคา ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: checkscreenwidth(screenWidth, 36.37),
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '฿ 13000',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize:
                                          checkscreenwidth(screenWidth, 36.37),
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: checkscreenwidth(screenWidth, 33.34),
                  ),
                  Image.asset("assets/images/GPS-Blue-Box-2-03.jpg"),
                  Image.asset("assets/images/GPS-Blue-Box-2-05.jpg"),
                  // Free service Advertise
                  SizedBox(
                    height: checkscreenwidth(screenWidth, 33.34),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: checkscreenwidth(screenWidth, 15.714),
                        ),
                        children: [
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 7.0967),
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: svgLogo(checkscreenwidth(screenWidth, 22),
                                'assets/icon/gift-box-with-a-ribbon.svg'),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 22),
                            ),
                          ),
                          TextSpan(
                            text: 'ฟรี !',
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 22),
                            ),
                          ),
                          TextSpan(
                              text: 'เครื่องรูดบัตร',
                              style: TextStyle(color: Color(0XFF464646))),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: checkscreenwidth(screenWidth, 15.714),
                        ),
                        children: [
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 7.0967),
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: svgLogo(checkscreenwidth(screenWidth, 22),
                                'assets/icon/gift-box-with-a-ribbon.svg'),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 22),
                            ),
                          ),
                          TextSpan(
                            text: 'ฟรี !',
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 22),
                            ),
                          ),
                          TextSpan(
                              text: 'ค่าติดตั้ง',
                              style: TextStyle(color: Color(0XFF464646))),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: checkscreenwidth(screenWidth, 15.714),
                        ),
                        children: [
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 7.0967),
                            ),
                          ),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: svgLogo(checkscreenwidth(screenWidth, 22),
                                'assets/icon/gift-box-with-a-ribbon.svg'),
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 22),
                            ),
                          ),
                          TextSpan(
                            text: 'ฟรี !',
                          ),
                          WidgetSpan(
                            child: SizedBox(
                              width: checkscreenwidth(screenWidth, 22),
                            ),
                          ),
                          TextSpan(
                              text: 'ค่า Airtime ปีแรก',
                              style: TextStyle(color: Color(0XFF464646))),
                        ],
                      ),
                    ),
                  ),
                  Image.asset("assets/images/promotion.png"),
                  Image.asset("assets/images/GPS-Blue-Box-2-08.jpg"),
                  Image.asset("assets/images/GPS-Blue-Box-2-02.jpg"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        svgLogo(checkscreenwidth(screenWidth, 5.5),
                            'assets/icon/serviceman.svg',
                            color: Colors.black),
                        Column(
                          children: [
                            Text(
                              "ติดตั้ง GPS",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: checkscreenwidth(screenWidth, 9.243),
                              ),
                            ),
                            Text(
                              "โดยช่างผู้ชำนาญ",
                              style: TextStyle(
                                color: Color(0XFF464646),
                                fontSize: checkscreenwidth(screenWidth, 15.714),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.asset("assets/images/GPS-Blue-Box-2-06.jpg"),
                  Image.asset("assets/images/GPS-Blue-Box-2-07.jpg"),
                  //Wait Video
                  VideoApp(),
                  Image.asset("assets/images/ปุ่มโทร.jpg"),
                  Image.asset("assets/images/ติดต่อสอบถามทางไลน์.png"),
                  Image.asset("assets/images/ขั้นตอนการสั่งซื้อ-edit.jpg"),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(29, 30, 0, 10),
                      child: Text(
                        "เรื่องการซื้อและการรับประกัน GPS",
                        style: TextStyle(
                          color: Color(0xFF00AEF0),
                          fontSize: checkscreenwidth(screenWidth, 33.334),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 29),
                      child: Text(
                        "สินค้ารับประกัน 1 ปี (เฉพาะตัวกล่อง) หากลูกค้ามีคำถาม โปรดติดต่อฝ่ายบริการลูกค้าออนไลน์",
                        style: TextStyle(
                          color: Color(0xFF464646),
                          fontSize: checkscreenwidth(screenWidth, 55),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 29),
                      child: Text.rich(
                        TextSpan(
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                            children: [
                              TextSpan(
                                text: 'โทร.',
                              ),
                              TextSpan(
                                text: ' 096-907-8592 ',
                                style: TextStyle(
                                  color: Color(0XFF00AEF0),
                                ),
                              ),
                              TextSpan(
                                text: ' หรือทางอีเมล์ ',
                              ),
                              TextSpan(
                                text: ' online@dtc.co.th',
                                style: TextStyle(
                                  color: Color(0XFF00AEF0),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(29, 30, 0, 10),
                      child: Text(
                        "ขั้นตอนการซื้อ GPS",
                        style: TextStyle(
                          color: Color(0xFF00AEF0),
                          fontSize: checkscreenwidth(screenWidth, 33.334),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 29),
                      child: Text("""
1. คลิกสั่งซื้อทันที 
2. เลือกจำนวนกล่องที่ท่านต้องการ 
3. ชำระเงินโดยการ โอนเงินพร้อมแนบสลิป 
4. กรอกข้อมูลให้ถูกต้องและครบถ้วน 
5. กดยืนยันออเดอร์ 
6. หมายเลขคำสั่งซื้อของท่านจะถูกจัดส่งไปทางอีเมล 
7. เจ้าหน้าโทรยืนยันข้อมูลและนัดวันติดตั้ง 
8. รอติดตั้ง GPS ภายใน 3 วัน""",
                          style: TextStyle(
                            color: Color(0xFF464646),
                            fontSize: checkscreenwidth(screenWidth, 55),
                          ),
                          maxLines: 8),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(29, 30, 0, 10),
                      child: Text(
                        "คำถามที่พบบ่อย",
                        style: TextStyle(
                          color: Color(0xFF00AEF0),
                          fontSize: checkscreenwidth(screenWidth, 33.334),
                        ),
                      ),
                    ),
                  ),
                  HomeExpandingCard(
                    title:
                        "กรมขนส่งทางบกบังคับให้รถประเภทใดบ้างที่ต้องติด GPS?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
กลุ่มรถ 2 ประเภท คือ 
- รถโดยสารสาธารณะ เช่น รถโดยสารสองชั้น รถบัส, รถบัส 2 ชั้น, รถตู้โดยสาร, รถ Taxi, รถตู้ (ป้ายเหลือง) 
- รถบรรทุกขนาดใหญ่ เช่น รถบรรทุกนาดใหญ่ 10 ล้อขึ้นไป, รถลากจูง, รถขนวัตถุอันตราย""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title:
                        "กรมขนส่งทางบกมีหลักเกณฑ์ในการบังคับใช้ให้รถโดยสารสาธารณะ และรถบรรทุกติด GPS อย่างไรบ้าง?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "1. รถโดยสารสาธารณะ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
- รถโดยสารทุกประเภท ป้ายแดง (จดทะเบียนใหม่) ให้เริ่มบังคับใช้จะต้องติดตั้ง GPS ตั้งแต่ 25 มกราคม 2559 เป็นต้นไป 
- รถโดยสารทุกประเภท ป้ายเก่า (จดทะเบียนก่อนปี 59) จะต้องติดตั้ง GPS ให้เสร็จสิ้นภายในรอบภาษีปี 2560 
- รถโดยสารสองชั้น ป้ายเก่า (จดทะเบียนก่อนปี 56) จะต้องติดตั้ง GPS ให้เสร็จสิ้นภายในรอบภาษีปี 2559 
- รถ Taxi ใหม่ ป้ายแดง รอประกาศจากกระทรวง ซึ่งจะบังคับให้ติดตั้งทันทีที่กฎกระทรวงมีผลใช้บังคับ 
- รถโดยสารทุกประเภท ป้ายเก่า (จดทะเบียนก่อนปี 59) ที่ได้ติดตั้ง GPS ไว้แล้ว และเป็นรุ่นที่ไม่ผ่านการรับรองจาก 
  กรมขนส่งทางบกแต่สามารถเชื่อมโยงข้อมูลกับกรมขนส่งได้ ยังสามารถใช้ GPS รุ่นเดิมได้ถึงปี 2562""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "2. รถบรรทุกขนาดใหญ่",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
- รถบรรทุก 10 ล้อและรถลากจูง ป้ายแดง (จดทะเบียนใหม่) ให้เริ่มบังคับใช้ จะต้องติดตั้ง GPS ตั้งแต่ 25 มกราคม 2559 เป็นต้นไป 
- รถลากจูง ป้ายเก่า (จดทะเบียนก่อนปี 59) จะต้องติดตั้ง GPS ให้เสร็จสิ้นภายในรอบภาษีปี 2560 
- รถบรรทุก 10 ล้อ สาธารณะ ป้ายเก่า (จดทะเบียนก่อนปี 59) จะต้องติดตั้ง GPS ให้เสร็จสิ้นภายในรอบภาษีปี 2561 
- รถบรรทุก 10 ล้อ ส่วนบุคคล ป้ายเก่า (จดทะเบียนก่อนปี 59) จะต้องติดตั้ง GPS ให้เสร็จสิ้นภายในรอบภาษีปี 2562 
- รถบรรทุก 10 ล้อและรถลากจูง ป้ายเก่า (จดทะเบียนก่อนปี 59) ที่ได้ติดตั้ง GPS ไว้แล้ว และเป็นรุ่นที่ไม่ผ่านการรับรอง 
  จากกรมขนส่งทางบกแต่สามารถเชื่อมโยงข้อมูลกับกรมขนส่งได้ ยังสามารถใช้ GPS รุ่นเดิมได้ถึงปี 2562""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title:
                        "ถ้ารถอยู่ในเงื่อนไขบังคับใช้ GPS แต่ไม่ได้ทำการติดตั้ง GPS ตามเงื่อนไข จะส่งผลกระทบอย่างไรบ้าง?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
กรณีรถที่อยู่ในเงื่อนไขการบังคับใช้ GPS แต่ยังไม่ได้ติดตั้งตามเงื่อนไขของกรมการขนส่งทางบก ท่านจะไม่สามารถต่อทะเบียนรถ 
ได้ทุกกรณี เนื่องจากเจ้าหน้าที่ตรวจสภาพรถ จะตรวจสอบการติดตั้ง GPS ในรถของท่าน ดังนั้นจะต้องดำเนินการติดตั้ง GPS 
กับบริษัทที่ได้รับการรับรองจากกรมขนส่งทางบกก่อน แล้วจึงนำรถพร้อมใบรับรองการติดตั้งไปยื่นขอจดทะเบียนรถได้""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title: "ระยะเวลาในการรับประกัน อุปกรณ์ GPS ติดตามยานพาหนะ?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
บริษัทจะรับประกันสินค้า 1 ปี เฉพาะตัวกล่องและเครื่องรูดบัตร (รับประกันความเสียหายอันเนื่องมาจากการใช้งานตามปกติ เป็นระยะเวลา 1 ปี) *การรับประกันรวมถึง ค่าอะไหล่ ,ค่าบริการ ,และค่าเดินทาง*""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title:
                        "การเก็บข้อมูล (Blckup Data) และดูข้อมูล ของลูกค้าที่ใช้ระบบติดตาม ยานพาหนะ?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
การเก็บข้อมูล (Blackup Data) กำหนดระยะเวลา 6 เดือน แต่จะแสดงผลให้ลูกค้าดู 45 วัน และการดูแลข้อมูล จะอยู่ภายใต้ การดูแล ควบคุมจากทีมงานเป็นอย่างดี""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title:
                        "การ Update Application มีเงื่อนไขหรือค่าใช้จ่ายอย่างไร?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
โดยปกติแล้ว Application ของเราจะมีการ Update เป็นประจำอยู่แล้วเพื่อให้ลูกค้าได้ใช้งานระบบที่มีประสิทธิภาพมากยิ่งขึ้น โดยไม่มีค่าใช้จ่ายใดๆ""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title: "สามารถใช้โปรแกรมได้กี่เครื่อง?",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
1 Login สามารถใช้โปรแกรมได้หลายเครื่อง ไม่จำกัดจำนวนเครื่อง""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  HomeExpandingCard(
                    title: "ค่าใช้จ่ายการติดตั้ง",
                    detail: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            """
ทางบริษัทเป็นผู้รับผิดชอบค่าใช้จ่ายการติดตั้ง""",
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 30, 0, 10),
                      child: Text(
                        "ข้อมูลในการติดต่อ",
                        style: TextStyle(
                          color: Color(0xFF00AEF0),
                          fontSize: checkscreenwidth(screenWidth, 33.334),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text.rich(
                        TextSpan(
                            style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                            ),
                            children: [
                              TextSpan(
                                text: 'ติดต่อฝ่ายบริการลูกค้าออนไลน์',
                              ),
                              TextSpan(
                                text: """

โทร.""",
                              ),
                              TextSpan(
                                text: ' 096-907-8592 ',
                                style: TextStyle(
                                  color: Color(0XFF00AEF0),
                                ),
                              ),
                              TextSpan(
                                text: """

อีเมล์""",
                              ),
                              TextSpan(
                                text: ' online@dtc.co.th',
                                style: TextStyle(
                                  color: Color(0XFF00AEF0),
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: HomeBottomNavBar());
  }
}
