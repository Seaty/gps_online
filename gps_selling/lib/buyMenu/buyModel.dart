// To parse this JSON data, do
//
//     final buyInfo = buyInfoFromJson(jsonString);

import 'dart:convert';

BuyInfo buyInfoFromJson(String str) => BuyInfo.fromJson(json.decode(str));

String buyInfoToJson(BuyInfo data) => json.encode(data.toJson());

class BuyInfo {
  BuyInfo({
    this.fullname,
    this.tel,
    this.province,
    this.amphur,
    this.address,
    this.postcode,
    this.chassis,
    this.chassisFile,
    this.slipFile,
    this.email,
    this.remark,
    this.amount,
    this.userId,
  });

  String fullname;
  String tel;
  String province;
  String amphur;
  String address;
  String postcode;
  String chassis;
  String chassisFile;
  String slipFile;
  String email;
  String remark;
  int amount;
  String userId;

  factory BuyInfo.fromJson(Map<String, dynamic> json) => BuyInfo(
        fullname: json["fullname"] == null ? null : json["fullname"],
        tel: json["tel"] == null ? null : json["tel"],
        province: json["province"] == null ? null : json["province"],
        amphur: json["amphur"] == null ? null : json["amphur"],
        address: json["address"] == null ? null : json["address"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        chassis: json["chassis"] == null ? null : json["chassis"],
        chassisFile: json["chassis_file"] == null ? null : json["chassis_file"],
        slipFile: json["slip_file"] == null ? null : json["slip_file"],
        email: json["email"] == null ? null : json["email"],
        remark: json["remark"] == null ? null : json["remark"],
        amount: json["amount"] == null ? null : json["amount"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname == null ? null : fullname,
        "tel": tel == null ? null : tel,
        "province": province == null ? null : province,
        "amphur": amphur == null ? null : amphur,
        "address": address == null ? null : address,
        "postcode": postcode == null ? null : postcode,
        "chassis": chassis == null ? null : chassis,
        "chassis_file": chassisFile == null ? null : chassisFile,
        "slip_file": slipFile == null ? null : slipFile,
        "email": email == null ? null : email,
        "remark": remark == null ? null : remark,
        "amount": amount == null ? null : amount,
        "user_id": userId == null ? null : userId,
      };
}
