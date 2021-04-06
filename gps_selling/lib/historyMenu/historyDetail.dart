import 'package:flutter/material.dart';
import 'package:gps_selling/historyMenu/historyData.dart';
import 'package:gps_selling/historyMenu/historyModel.dart';

class HistoryDetailPage extends StatefulWidget {
  final HistoryData getData;

  HistoryDetailPage({this.getData});

  @override
  _HistoryDetailPageState createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  HistoryData showData;
  double screenWidth;

  Future<dynamic> _loadingState() {
    showData = widget.getData;

    return Future.delayed(new Duration(seconds: 3), () => true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    print(widget.getData);
    return FutureBuilder(
        future: _loadingState(),
        builder: (context, snapshot) {
          if (ConnectionState.waiting == snapshot.connectionState) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text("ไม่พบหน้าที่คุณต้องการหา กรุณากลับไปยังหน้าหลัก"),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "กลับสู่หน้าหลัก",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 50,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasData) {
            return Scaffold(
                appBar: AppBar(title: Text("รายละเอียดการสั่งซื้อ")),
                body: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: checkscreenwidth(screenWidth, 55),
                      horizontal: checkscreenwidth(screenWidth, 55)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ข้อมูล",
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 22),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: "เลขออเดอร์ :",
                                    style: TextStyle(
                                      fontSize:
                                          checkscreenwidth(screenWidth, 55),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " ${showData.orderId}",
                                        style: TextStyle(
                                          color: Color(0xFF00AEF0),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text.rich(
                                  TextSpan(
                                    text: "วันสั่งซื้อ :",
                                    style: TextStyle(
                                      fontSize:
                                          checkscreenwidth(screenWidth, 55),
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            " ${f.format(showData.orderTime)}",
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Column(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: "สถานะ :",
                                    style: TextStyle(
                                      fontSize:
                                          checkscreenwidth(screenWidth, 55),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " ${showData.statusText()}",
                                        style: TextStyle(
                                          color: showData.statusColor(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                if (showData.status == 0)
                                  Text.rich(
                                  TextSpan(
                                    text: "สถานะ :",
                                    style: TextStyle(
                                      fontSize:
                                          checkscreenwidth(screenWidth, 55),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " ${showData.statusText()}",
                                        style: TextStyle(
                                          color: showData.statusColor(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                if (showData.status == 0)
                                  Text.rich(
                                    TextSpan(
                                      text: "(${showData.reason})",
                                      style:
                                          TextStyle(color: Color(0xFFEA5455)),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "รายละเอียดสินค้า",
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 22),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      detailInfoView("ชื่อสินค้า", showData.prodName),
                      detailInfoView("จำนวน", "${showData.amount} ชิ้น"),
                      detailInfoView("ราคา", "${showData.price} บาท"),
                      detailInfoView("ทั้งหมด", "${showData.totlePrice()} บาท"),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "ที่อยู่ที่จัดส่ง",
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 22),
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      detailInfoView("ที่อยู่", showData.address),
                      detailInfoView("ตำบล/แขวง", showData.tambon),
                      detailInfoView("อำเภอ/เขต", showData.amphur),
                      detailInfoView("จังหวัด", showData.province),
                      detailInfoView("รหัสไปรษณ๊ย์", showData.postcode),
                    ],
                  ),
                ));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }

  Row detailInfoView(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$label : ",
          style: TextStyle(fontSize: checkscreenwidth(screenWidth, 55)),
        ),
        Text(value)
      ],
    );
  }
}
