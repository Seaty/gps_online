import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

HistoryData historyDataFromJson(String str) =>
    HistoryData.fromJson(json.decode(str));

String historyDataToJson(HistoryData data) => json.encode(data.toJson());

class HistoryData {
  final f = new DateFormat('yyyy-MM-dd HH:mm');

  HistoryData({
    this.orderId,
    this.prodName,
    this.price,
    this.status,
    this.amount,
    this.orderTime,
    this.paidTime,
    this.address,
    this.tel,
    this.province,
    this.amphur,
    this.tambon,
    this.postcode,
    this.fullname,
    this.reason,
    this.lastUpdate,
    this.cancelTime,
    this.email,
  });

  String orderId;
  String prodName;
  double price;
  int status;
  double amount;
  DateTime orderTime;
  DateTime paidTime;
  String address;
  String tel;
  String province;
  String amphur;
  String tambon;
  String postcode;
  String fullname;
  String reason;
  DateTime lastUpdate;
  DateTime cancelTime;
  String email;

  factory HistoryData.fromJson(Map<String, dynamic> json) => HistoryData(
        orderId: json["order_id"] == null ? null : json["order_id"],
        prodName: json["prod_name"] == null ? null : json["prod_name"],
        price: json["price"] == null ? null : json["price"],
        status: json["status"] == null ? null : json["status"],
        amount: json["amount"] == null ? null : json["amount"],
        orderTime: json["order_time"] == null
            ? null
            : DateTime.parse(json["order_time"]),
        paidTime: json["paid_time"] == null
            ? null
            : DateTime.parse(json["paid_time"]),
        address: json["address"] == null ? null : json["address"],
        tel: json["tel"] == null ? null : json["tel"],
        province: json["province"] == null ? null : json["province"],
        amphur: json["amphur"] == null ? null : json["amphur"],
        tambon: json["tambon"] == null ? null : json["tambon"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        reason: json["reason"] == null ? null : json["reason"],
        lastUpdate: json["last_update"] == null
            ? null
            : DateTime.parse(json["last_update"]),
        cancelTime: json["cancel_time"] == null
            ? null
            : DateTime.parse(json["cancel_time"]),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId == null ? null : orderId,
        "prod_name": prodName == null ? null : prodName,
        "price": price == null ? null : price,
        "status": status == null ? null : status,
        "amount": amount == null ? null : amount,
        "order_time": orderTime == null ? null : orderTime.toIso8601String(),
        "paid_time": paidTime == null ? null : paidTime.toIso8601String(),
        "address": address == null ? null : address,
        "tel": tel == null ? null : tel,
        "province": province == null ? null : province,
        "amphur": amphur == null ? null : amphur,
        "tambon": tambon == null ? null : tambon,
        "postcode": postcode == null ? null : postcode,
        "fullname": fullname == null ? null : fullname,
        "reason": reason == null ? null : reason,
        "last_update": lastUpdate == null ? null : lastUpdate.toIso8601String(),
        "cancel_time": cancelTime == null ? null : cancelTime.toIso8601String(),
        "email": email == null ? null : email,
      };

  String getOrderDateString() => f.format(this.orderTime);

  String statusText() {
    if (status == 0) {
      return "ยกเลิกรายการ";
    } else if (status == 1) {
      return "รอชำระเงิน";
    } else if (status == 2) {
      return "รอการนัดหมาย";
    } else if (status == 3) {
      return "รอการติดตั้ง";
    } else if (status == 4) {
      return "เสร็จสิ้น";
    }
    return "ไม่พบสถานะ";
  }

  Color statusColor() {
    if (status == 0) {
      return Color(0xFFEA5455);
    } else if (status == 1 || status == 2 || status == 3) {
      return Color(0xFFFF9F43);
    } else if (status == 4) {
      return Color(0xFF28C76F);
    }
    return Color(0xFF464646);
  }

  double totlePrice() {
    return amount * price;
  }

}
