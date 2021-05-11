// To parse this JSON data, do
//
//     final vn = vnFromJson(jsonString);

import 'dart:convert';

Vn vnFromJson(String str) => Vn.fromJson(json.decode(str));

String vnToJson(Vn data) => json.encode(data.toJson());

class Vn {
  Vn({
    this.data,
  });

  Data data;

  factory Vn.fromJson(Map<String, dynamic> json) => Vn(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.queueData,
  });

  List<QueueDatum> queueData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    queueData: List<QueueDatum>.from(json["queue_data"].map((x) => QueueDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "queue_data": List<dynamic>.from(queueData.map((x) => x.toJson())),
  };
}

class QueueDatum {
  QueueDatum({
    this.qCode,
    this.vn,
    this.spName,
    this.qStatus,
    this.unitName,
    this.qNum,
    this.createDate,
    this.updateDate,
  });

  String qCode;
  String vn;
  String spName;
  String qStatus;
  String unitName;
  String qNum;
  DateTime createDate;
  DateTime updateDate;

  factory QueueDatum.fromJson(Map<String, dynamic> json) => QueueDatum(
    qCode: json["q_code"],
    vn: json["vn"],
    spName: json["sp_name"],
    qStatus: json["q_status"],
    unitName: json["unit_name"],
    qNum: json["q_num"],
    createDate: DateTime.parse(json["create_date"]),
    updateDate: DateTime.parse(json["update_date"]),
  );

  Map<String, dynamic> toJson() => {
    "q_code": qCode,
    "vn": vn,
    "sp_name": spName,
    "q_status": qStatus,
    "unit_name": unitName,
    "q_num": qNum,
    "create_date": createDate.toIso8601String(),
    "update_date": updateDate.toIso8601String(),
  };
}
