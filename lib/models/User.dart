// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.status,
    this.message,
    this.data,
  });

  String status;
  String message;
  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.infoData,
  });

  InfoData infoData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    infoData: InfoData.fromJson(json["info_data"]),
  );

  Map<String, dynamic> toJson() => {
    "info_data": infoData.toJson(),
  };
}

class InfoData {
  InfoData({
    this.hn,
    this.prenameText,
    this.fname,
    this.lname,
    this.cid,
    this.birth,
    this.age,
    this.abogroupText,
    this.sexText,
    this.currentAddress,
    this.currentTambon,
    this.currentAmphur,
    this.currentProvince,
    this.currentZipcode,
    this.currentAddressTel,
    this.phone,
    this.fullname,
  });

  String hn;
  String prenameText;
  String fname;
  String lname;
  String cid;
  String birth;
  String age;
  String abogroupText;
  String sexText;
  String currentAddress;
  String currentTambon;
  String currentAmphur;
  String currentProvince;
  String currentZipcode;
  String currentAddressTel;
  String phone;
  String fullname;

  factory InfoData.fromJson(Map<String, dynamic> json) => InfoData(
    hn: json["hn"],
    prenameText: json["prename_text"],
    fname: json["fname"],
    lname: json["lname"],
    cid: json["cid"],
    birth: json["birth"],
    age: json["age"],
    abogroupText: json["abogroup_text"],
    sexText: json["sex_text"],
    currentAddress: json["current_address"],
    currentTambon: json["current_tambon"],
    currentAmphur: json["current_amphur"],
    currentProvince: json["current_province"],
    currentZipcode: json["current_zipcode"],
    currentAddressTel: json["current_address_tel"],
    phone: json["phone"],
    fullname: json["fullname"],
  );

  Map<String, dynamic> toJson() => {
    "hn": hn,
    "prename_text": prenameText,
    "fname": fname,
    "lname": lname,
    "cid": cid,
    "birth": birth,
    "age": age,
    "abogroup_text": abogroupText,
    "sex_text": sexText,
    "current_address": currentAddress,
    "current_tambon": currentTambon,
    "current_amphur": currentAmphur,
    "current_province": currentProvince,
    "current_zipcode": currentZipcode,
    "current_address_tel": currentAddressTel,
    "phone": phone,
    "fullname": fullname,
  };
}
