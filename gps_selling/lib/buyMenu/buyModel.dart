import 'dart:convert';

import 'dart:typed_data';

BuyData buyDataFromJson(String str) => BuyData.fromJson(json.decode(str));

String buyDataToJson(BuyData data) => json.encode(data.toJson());

String buyDataToBodyJson(BuyData data) => json.encode(data.toBodyJson());

class BuyData {
  BuyData({
    this.amount,
    this.fullname,
    this.tel,
    this.fbId,
    this.province,
    this.amphur,
    this.tambon,
    this.address,
    this.postcode,
    this.chassisNumber,
    this.chassisImage,
    this.slipImage,
    this.email,
    this.remark,
  });

  int amount;
  String fullname;
  String tel;
  String fbId;
  String province;
  String amphur;
  String tambon;
  String address;
  String postcode;
  String chassisNumber;
  Uint8List chassisImage;
  Uint8List slipImage;
  String email;
  String remark;

  factory BuyData.fromJson(Map<String, dynamic> json) => BuyData(
        amount: json["amount"] == null ? null : json["amount"],
        fullname: json["fullname"] == null ? null : json["fullname"],
        tel: json["tel"] == null ? null : json["tel"],
        fbId: json["fb_id"] == null ? null : json["fb_id"],
        province: json["province"] == null ? null : json["province"],
        amphur: json["amphur"] == null ? null : json["amphur"],
        tambon: json["tambon"] == null ? null : json["tambon"],
        address: json["address"] == null ? null : json["address"],
        postcode: json["postcode"] == null ? null : json["postcode"],
        chassisNumber:
            json["chassis_number"] == null ? null : json["chassis_number"],
        chassisImage:
            json["chassis_image"] == null ? null : json["chassis_image"],
        slipImage: json["slip_image"] == null ? null : json["slip_image"],
        email: json["email"] == null ? null : json["email"],
        remark: json["remark"] == null ? null : json["remark"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "fullname": fullname == null ? null : fullname,
        "tel": tel == null ? null : tel,
        "fb_id": fbId == null ? null : fbId,
        "province": province == null ? null : province,
        "amphur": amphur == null ? null : amphur,
        "tambon": tambon == null ? null : tambon,
        "address": address == null ? null : address,
        "postcode": postcode == null ? null : postcode,
        "chassis_number": chassisNumber == null ? null : chassisNumber,
        "chassis_image": chassisImage == null ? null : chassisImage,
        "slip_image": slipImage == null ? null : slipImage,
        "email": email == null ? null : email,
        "remark": remark == null ? null : remark,
      };

  Map<String, dynamic> toBodyJson() => {
        "amount": amount == null ? null : amount,
        "fullname": fullname == null ? null : fullname,
        "tel": tel == null ? null : tel,
        "fb_id": fbId == null ? null : fbId,
        "province": province == null ? null : province,
        "amphur": amphur == null ? null : amphur,
        "tambon": tambon == null ? null : tambon,
        "address": address == null ? null : address,
        "postcode": postcode == null ? null : postcode,
        "chassis_number": chassisNumber == null ? null : chassisNumber,
        "email": email == null ? null : email,
        "remark": remark == null ? null : remark,
      };
}
