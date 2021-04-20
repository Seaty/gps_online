import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gps_selling/buyMenu/buyData.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/orderMenu/orderData.dart';
import 'package:gps_selling/orderMenu/orderDetailPart.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/navigation_service.dart';

class OrderCheckMainPage extends StatefulWidget {
  @override
  _OrderCheckMainPageState createState() => _OrderCheckMainPageState();
}

class _OrderCheckMainPageState extends State<OrderCheckMainPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    isClick = false;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          title: Text("ระบบค้นหาและติดตามสินค้า"),
          leading: IconButton(
              icon: Icon(Icons.home),
              onPressed: () =>
                  locator<NavigationService>().navigateTo(HomeRoute))),
      body: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              //Search Zone
              Container(
                margin: EdgeInsets.all(
                  checkscreenwidth(screenWidth, 55),
                ),
                child: FormBuilderTextField(
                  name: 'orderId',
                  decoration: InputDecoration(
                    labelText: "กรุณาระบุเลขออเดอร์",
                    hintText: 'กรุณาระบุเลขออเดอร์',
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: checkscreenwidth(screenWidth, 55),
                        horizontal: checkscreenwidth(screenWidth, 55)),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF49ADEA), width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFF464646), width: 1.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFD5D5D5), width: 1.0),
                    ),
                  ),
                  onChanged: (values) {
                    // อ่านค่าจาก form _formKey.currentState.fields['orderId'].value;
                  },
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(context,
                        errorText: "กรุณาระบุเลขออเดอร์"),
                  ]),
                  keyboardType: TextInputType.name,
                ),
                // TextField(
                //   decoration: InputDecoration(
                //     labelText: 'ค้นหาออเดอร์',
                //     hintText: 'กรุณาระบุเลขออเดอร์',
                //   ),
                // ),
              ),
              Container(
                  margin: EdgeInsets.all(
                    checkscreenwidth(screenWidth, 55),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isClick = true;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search,
                                  // size: checkscreenwidth(screenWidth, 24),
                                ),
                                Text(
                                  "ค้นหา",
                                  style: TextStyle(
                                    color: Colors.white,
                                    // fontSize: checkscreenwidth(screenWidth, 33),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
              //Showing Zone
              Expanded(
                child: (isClick ? OrderDetailPart() : Container()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
