import 'package:flutter/material.dart';
import 'package:gps_selling/historyMenu/historyData.dart';
import 'package:gps_selling/historyMenu/historyModel.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/navigation_service.dart';

class HistoryMainPage extends StatefulWidget {
  @override
  _HistoryMainPageState createState() => _HistoryMainPageState();
}

class _HistoryMainPageState extends State<HistoryMainPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: FutureBuilder(
        future: getTempHistory(),
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text(
                'There was an error :(',
                style: TextStyle(color: Colors.red, fontSize: 40),
              ),
            );
          } else if (ConnectionState.waiting == snapshot.connectionState) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<HistoryData> historyData = snapshot.data;
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      locator<NavigationService>().navigateTo(
                          HistoryDetailRoute,
                          historydata: historyData[index]);
                    },
                    child: Card(
                      margin: EdgeInsets.all(checkscreenwidth(screenWidth, 55)),
                      color: Colors.white,
                      child: Padding(
                        padding:
                            EdgeInsets.all(checkscreenwidth(screenWidth, 110)),
                        child: Column(
                          children: [
                            //Upper part
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  radius: checkscreenwidth(screenWidth, 36.67),
                                  child: Icon(Icons.train_rounded),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          checkscreenwidth(screenWidth, 91.67),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          historyData[index].orderId,
                                          style: TextStyle(
                                            fontSize: checkscreenwidth(
                                                screenWidth, 27.5),
                                            color: Color(0xFF00AEF0),
                                          ),
                                        ),
                                        Text(
                                          historyData[index].statusText(),
                                          style: TextStyle(
                                            color: historyData[index]
                                                .statusColor(),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(
                                    checkscreenwidth(screenWidth, 110),
                                  ),
                                  child: Text(
                                    historyData[index].getOrderDateString(),
                                    style: TextStyle(
                                      color: Color(0xFF00AEF0),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            //Seperate line
                            Divider(
                              thickness: 2,
                            ),
                            //Lower part
                            Row(
                              children: [
                                Text("สินค้า "),
                                Text(" (จำนวน:${historyData[index].amount}) "),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                        " ราคา:${historyData[index].totlePrice()} "),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                  // return ListTile(
                  //   title: Text('รหัสออเดอร์ : ${historyData[index].orderId}'),
                  //   subtitle: Text('A strong animal'),
                  //   dense: true,
                  // );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
