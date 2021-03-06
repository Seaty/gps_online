import 'dart:typed_data';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gps_selling/buyMenu/buyData.dart';
import 'package:gps_selling/locator.dart';
import 'package:gps_selling/routing/router.dart';
import 'package:gps_selling/services/navigation_service.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:gps_selling/homeMenu/homeData.dart';

class BuyMainPage extends StatefulWidget {
  final double amount;
  const BuyMainPage({Key key, this.amount = 1}) : super(key: key);

  @override
  _BuyMainPageState createState() => _BuyMainPageState();
}

class _BuyMainPageState extends State<BuyMainPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  Uint8List _chassisImage;
  Uint8List _slipImage;
  String _slipErrorText;
  bool _isLoading;

  Future<bool> _onWillPopForm() async {
    return false;
  }

  double amount = 1;

  @override
  void initState() {
    _isLoading = false;
    amount = widget.amount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getInitData(amount),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ModalProgressHUD(
              inAsyncCall: _isLoading,
              // demo of some additional parameters
              opacity: 0.5,
              progressIndicator: CircularProgressIndicator(),
              child: Center(
                child: Column(
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
                ),
              ),
            );
          } else if (snapshot.hasData) {
            return mainBody(context);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget mainBody(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      // demo of some additional parameters
      opacity: 0.5,
      progressIndicator: CircularProgressIndicator(),
      child: FormBuilder(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        onWillPop: _onWillPopForm,
        initialValue: initUserData,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: checkscreenwidth(screenWidth, 22),
                      bottom: checkscreenwidth(screenWidth, 22)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/images/route.png",
                        height: checkscreenwidth(screenWidth, 7.33),
                        width: checkscreenwidth(screenWidth, 7.33),
                      ),
                      Text(
                        "GPS Tracking",
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 9.2437),
                          color: Color(0xFF00AEF0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/images/GPS-Blue-Box-2-02.jpg",
                      height: checkscreenwidth(screenWidth, 2.391),
                      width: checkscreenwidth(screenWidth, 2.391),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GPS TRACKING ",
                          style: TextStyle(
                            color: Color(0xFF00AEF0),
                            fontSize: checkscreenwidth(screenWidth, 22),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "(ผ่านกรมการขนส่งทางบก)",
                          style: TextStyle(
                            color: Color(0xFF00AEF0),
                            fontSize: checkscreenwidth(screenWidth, 22),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          """
สินค้า 1 ชุดประกอบด้วย""",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                            color: Color(0xFF00AEF0),
                          ),
                        ),
                        Text(
                          "- ชุดอุปกรณ์ติดตามยานพาหนะ",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                            color: Color(0xFF464646),
                          ),
                        ),
                        Text(
                          "- เครื่องรูดใบขับขี่และอุปกรณ์เตือนด้วยเสียง",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                            color: Color(0xFF464646),
                          ),
                        ),
                        Text(
                          "- ฟรี!! ค่าบริการ 1 ปี",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                            color: Color(0xFF464646),
                          ),
                        ),
                        Text(
                          " - ฟรี!! ค่าบริการติดตั้ง",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                            color: Color(0xFF464646),
                          ),
                        ),
                        SizedBox(
                          height: checkscreenwidth(screenWidth, 44),
                        ),
                        Text(
                          "“สั่งซื้อสินค้ากับเรา มั่นใจได้มาตรฐาน”",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.67),
                            color: Color(0xFF464646),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Divider(
                  height: 40,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "เลือกสินค้า",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 22),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: FormBuilderField(
                          name: "amount",
                          builder: (FormFieldState<dynamic> field) {
                            return CustomRadioButton(
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
                                field.didChange(values);
                                setState(() {
                                  this.amount = values;
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
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        "ทั้งหมด ${this.amount} ชุด รวม",
                        style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 36.667)),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          fontSize: checkscreenwidth(screenWidth, 22),
                        ),
                        text: "฿ ",
                        children: [
                          TextSpan(
                            text: (basePrice * this.amount).toStringAsFixed(2),
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
                                    borderRadius: BorderRadius.circular(3),
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
                Divider(
                  height: 40,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "ระบุข้อมูล",
                          style: TextStyle(
                            fontSize: checkscreenwidth(screenWidth, 22),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Form Section
                Column(
                  children: <Widget>[
                    //Hidden form
                    Container(
                      child: Visibility(
                        maintainState: true,
                        visible: false,
                        child: FormBuilderTextField(
                          name: 'fb_id',
                          decoration: formBorder(screenWidth),
                          // valueTransformer: (text) => num.tryParse(text),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "ชื่อ - นามสกุล",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderTextField(
                              name: 'fullname',
                              decoration: formBorder(screenWidth),
                              onChanged: (values) {
                                // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                              },
                              // valueTransformer: (text) => num.tryParse(text),
                              validator: (value) {
                                if (value == null) {
                                  return "กรุณาระบุ ชื่อ-นามสกุล";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "โทรศัพท์",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderTextField(
                              name: 'tel',
                              decoration: formBorder(screenWidth),
                              onChanged: (values) {
                                // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                              },
                              // valueTransformer: (text) => num.tryParse(text),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: "กรุณาระบุเบอร์โทรศัพท์"),
                                FormBuilderValidators.numeric(context,
                                    errorText: "กรุณาระบุเป็นตัวเลข"),
                              ]),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "จังหวัด",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderSearchableDropdown(
                                name: 'province',
                                showClearButton: true,
                                decoration: formBorder(screenWidth),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context,
                                      errorText: "กรุณาจังหวัด")
                                ]),
                                items: provinceList,
                                onChanged: (values) async {
                                  if (values != null) {
                                    _formKey.currentState.patchValue(
                                        {"amphur": null, "tambon": null});

                                    var result = await onProvinceChange(values);
                                    if (result) {
                                      setState(() {});
                                    }
                                  }
                                }),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "เขต/อำเภอ",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderSearchableDropdown(
                              name: 'amphur',
                              decoration: formBorder(screenWidth),
                              enabled: amphurList.length > 0,
                              showClearButton: true,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: "กรุณาเลือกอำเภอ")
                              ]),
                              items: amphurList,
                              onChanged: (value) async {
                                if (value != null) {
                                  _formKey.currentState
                                      .patchValue({"tambon": null});

                                  var result = await onAmphurChange(
                                      _formKey.currentState.fields['province']
                                          .value,
                                      value);
                                  if (result) {
                                    setState(() {});
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "ตำบล/แขวง",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderSearchableDropdown(
                              name: 'tambon',
                              showClearButton: false,
                              enabled: tambonList.length > 0,
                              decoration: formBorder(screenWidth),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: "กรุณาระบุรหัสไปรษณีย์")
                              ]),
                              items: tambonList,
                              onChanged: (value) async {
                                if (value != null) {
                                  var temp = await onTambonChange(
                                      _formKey.currentState.fields['province']
                                          .value,
                                      _formKey
                                          .currentState.fields['amphur'].value,
                                      value);
                                  setState(() {
                                    _formKey.currentState.fields['postcode']
                                        .didChange(temp);
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "ที่อยู่",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderTextField(
                              name: 'address',
                              decoration: formBorder(screenWidth),
                              onChanged: (values) {
                                // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                              },
                              // valueTransformer: (text) => num.tryParse(text),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: "กรุณาระบุที่อยู่"),
                              ]),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "รหัสไปรษณีย์",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderTextField(
                              enabled: false,
                              name: 'postcode',
                              decoration: formBorder(screenWidth),
                              onChanged: (values) {
                                // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                              },
                              // valueTransformer: (text) => num.tryParse(text),
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "หมายเลขตัวถังรถ",
                                  style: TextStyle(
                                    color: Color(0xFF464646),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormBuilderTextField(
                                  name: 'chassis_number',
                                  decoration: formBorder(screenWidth),
                                  onChanged: (values) {
                                    // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                                  },
                                  // valueTransformer: (text) => num.tryParse(text),
                                  validator: (value) {
                                    if (_chassisImage == null &&
                                        value == null) {
                                      return "กรุณาระบุเลชตัวถังรถ หรืออัพโหลดรูปตัวถังรถ";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.name,
                                ),
                                Text(
                                  "*หมายเหตุ ท่านสามารถเลือกใส่หมายเลขตัวถังรถ หรือ เลือกแนบไฟล์หน้าเล่มทะเบียน",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize: checkscreenwidth(screenWidth, 55),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "หน้าเล่มทะเบียนรถ",
                                  style: TextStyle(
                                    color: Color(0xFF464646),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: checkscreenwidth(screenWidth, 55),
                              horizontal: checkscreenwidth(screenWidth, 220),
                            ),
                            child: FormBuilderField(
                                name: 'chassis_image',
                                builder: (FormFieldState<Uint8List> field) {
                                  return ElevatedButton.icon(
                                    icon: svgLogo(
                                        checkscreenwidth(screenWidth, 25),
                                        "assets/icon/paper-clip.svg",
                                        color: Colors.white),
                                    onPressed: () async {
                                      FilePickerResult result =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.image,
                                      );
                                      if (result != null) {
                                        field.didChange(
                                            result.files.single.bytes);

                                        setState(() {
                                          _chassisImage =
                                              result.files.single.bytes;
                                        });
                                      }
                                    },
                                    label: Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        "แนบไฟล์",
                                        style: TextStyle(
                                            fontSize: checkscreenwidth(
                                                screenWidth, 36.67),
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: _chassisImage != null
                                ? Stack(
                                    children: [
                                      Image.memory(
                                        _chassisImage,
                                        height:
                                            checkscreenwidth(screenWidth, 11),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _chassisImage = null;
                                              });
                                            }),
                                      )
                                    ],
                                  )
                                : Text("ไม่มีรูปภาพ"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "การชำระเงิน",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 5.0),
                              child: Image.asset(
                                "assets/images/bbl_icon.png",
                                width: 4.4,
                              )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ชื่อบัญชี: บริษัท ดี.ที.ซี. เอ็นเตอร์ไพรส์ จำกัด",
                                  style: TextStyle(
                                    color: Color(0xFF06058D),
                                    fontSize: checkscreenwidth(screenWidth, 55),
                                  ),
                                ),
                                Text(
                                  "244-X-XXXXX-X",
                                  style: TextStyle(
                                      color: Color(0xFF06058D),
                                      fontSize:
                                          checkscreenwidth(screenWidth, 36.67),
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: checkscreenwidth(screenWidth, 55),
                                horizontal: checkscreenwidth(screenWidth, 220)),
                            child: FormBuilderField(
                              name: 'slip_image',
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context),
                              ]),
                              decoration:
                                  InputDecoration(errorText: _slipErrorText),
                              builder: (FormFieldState<Uint8List> field) {
                                return ElevatedButton.icon(
                                  icon: svgLogo(
                                      checkscreenwidth(screenWidth, 25),
                                      "assets/icon/paper-clip.svg",
                                      color: Colors.white),
                                  onPressed: () async {
                                    FilePickerResult result =
                                        await FilePicker.platform.pickFiles(
                                      type: FileType.image,
                                    );
                                    if (result != null) {
                                      field
                                          .didChange(result.files.single.bytes);
                                      setState(() {
                                        _slipImage = result.files.single.bytes;
                                      });
                                    }
                                  },
                                  label: Container(
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text(
                                      "แนบสลิป",
                                      style: TextStyle(
                                          fontSize: checkscreenwidth(
                                              screenWidth, 36.67),
                                          color: Colors.white),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: _slipImage != null
                                ? Stack(
                                    children: [
                                      Image.memory(
                                        _slipImage,
                                        height:
                                            checkscreenwidth(screenWidth, 11),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            icon: Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                _slipImage = null;
                                              });
                                            }),
                                      )
                                    ],
                                  )
                                : Text("ไม่มีรูปภาพ"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _slipErrorText != null
                              ? Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    _slipErrorText,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize:
                                            checkscreenwidth(screenWidth, 55)),
                                  ),
                                )
                              : Container(),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "* ",
                                  style: TextStyle(
                                    color: Color(0xFFD31414),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "อีเมล",
                                      style: TextStyle(
                                        color: Color(0xFF464646),
                                        fontSize: checkscreenwidth(
                                            screenWidth, 36.67),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderTextField(
                              name: 'email',
                              decoration: formBorder(screenWidth),
                              onChanged: (values) {
                                // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                              },
                              // valueTransformer: (text) => num.tryParse(text),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(context,
                                    errorText: "กรุณาระบุอีเมล"),
                                FormBuilderValidators.email(context,
                                    errorText: "รูปแบบอีเมลไม่ถูกต้อง")
                              ]),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: "บันทึก",
                                  style: TextStyle(
                                    color: Color(0xFF464646),
                                    fontSize:
                                        checkscreenwidth(screenWidth, 36.67),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FormBuilderTextField(
                              name: 'remark',
                              decoration: formBorder(screenWidth),
                              onChanged: (values) {
                                // อ่านค่าจาก form _formKey.currentState.fields['fullname'].value;
                              },
                              // valueTransformer: (text) => num.tryParse(text),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "*หมายเหตุ",
                          style: TextStyle(
                              color: Color(0xFF464646),
                              fontSize: checkscreenwidth(screenWidth, 55),
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 30),
                            width: screenWidth * 0.8,
                            child: Text(
                              "หากคุณมีคำถามใดๆ หลังจากการสั่งสินค้า โปรดติดต่อฝ่ายบริการลูกค้าออนไลน์ โทร. 096-907-8592 หรือ online@dtc.co.th โปรดแจ้งชื่อของคุณ ข้อมูลการสั่งซื้อ เบอร์ติดต่อกลับ พนักงานบริการลูกค้าของเราจะจัดการให้คุณ อย่างรวดเร็ว",
                              style: TextStyle(
                                color: Color(0xFF464646),
                                fontSize: checkscreenwidth(screenWidth, 55),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                //Bottom Button
                Divider(
                  height: 40,
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                Container(
                  margin: EdgeInsets.all(checkscreenwidth(screenWidth, 110)),
                  child: ElevatedButton(
                    onPressed: () async {
                      final isValidate =
                          _formKey.currentState.saveAndValidate();
                      var slipfile =
                          _formKey.currentState.fields['slip_image'].value;
                      if (slipfile == null) {
                        setState(() {
                          _slipErrorText = 'กรุณาแนบรูปสลิปการโอนเงิน';
                        });
                      } else {
                        setState(() {
                          _slipErrorText = null;
                        });
                        if (isValidate) {
                          setState(() {
                            _isLoading = true;
                          });
                          var result = await confirmOrderProcess(
                              _formKey.currentState.value);
                          setState(() {
                            _isLoading = false;
                          });
                          if (result is String) {
                            locator<NavigationService>()
                                .navigateTo(ConfirmOrderRoute, orderId: result);
                          } else {
                            showDialog(
                              context: context,
                              builder: errorAlert,
                            );
                          }
                        }
                      }
                      // Navigator.of(context).pushNamed(ConfirmOrderRoute);
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check_circle,
                            size: checkscreenwidth(screenWidth, 24),
                          ),
                          Text(
                            "ยืนยันการสั่งซื้อ",
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
          ),
        ),
      ),
    );
  }

  Widget errorAlert(BuildContext context) => AlertDialog(
        title: Text("เกิดความผิดพลาดในระบบ"),
        content: Text("กรุณาลองใหม่อีกครั้ง"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text("ตกลง"))
        ],
      );
}
