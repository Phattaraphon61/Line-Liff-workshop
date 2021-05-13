// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.data,
  });

  Data data;

  factory User.fromJson(Map<String, dynamic> json) => User(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.infoData,
  });

  List<InfoDatum> infoData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    infoData: List<InfoDatum>.from(json["info_data"].map((x) => InfoDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "info_data": List<dynamic>.from(infoData.map((x) => x.toJson())),
  };
}

class InfoDatum {
  InfoDatum({
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
    this.currentZipcode,
    this.currentAddressTel,
    this.phone,
    this.fullname,
    this.province,
    this.amphur,
    this.tambon,
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
  String currentZipcode;
  String currentAddressTel;
  String phone;
  String fullname;
  String province;
  String amphur;
  String tambon;

  factory InfoDatum.fromJson(Map<String, dynamic> json) => InfoDatum(
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
    currentZipcode: json["current_zipcode"],
    currentAddressTel: json["current_address_tel"],
    phone: json["phone"],
    fullname: json["fullname"],
    province: json["province"],
    amphur: json["amphur"],
    tambon: json["tambon"],
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
    "current_zipcode": currentZipcode,
    "current_address_tel": currentAddressTel,
    "phone": phone,
    "fullname": fullname,
    "province": province,
    "amphur": amphur,
    "tambon": tambon,
  };
}
