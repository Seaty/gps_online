import 'package:flutter/material.dart';

double checkscreenwidth(double meidawidth, double multiply) {
  if (meidawidth > 1100) {
    meidawidth = 1100;
  }
  return meidawidth / multiply < 14 ? 14 : meidawidth / multiply;
}

Color borderBgColorState(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return Color(0xFF91D8F2);
  }
  return Colors.white;
}

class OrderDetail {
  String orderId;
  DateTime orderTime;
  int status;
  String fullname;
  String orderName;
  int amount;
  String tel;
  String address;
  String email;
  String remark;
  String reason;

  OrderDetail(
      {@required this.orderId,
      this.orderTime,
      @required this.status,
      this.fullname,
      this.amount,
      this.tel,
      this.address,
      this.email,
      this.remark,
      this.orderName,
      this.reason}) {
    assert(orderId != null, "Order ID is required");
    assert(status != null, "Status is required");
  }

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

  String getHideName() {
    String showname = fullname.substring(8);
    return showname + '**************';
  }
}
