// To parse this JSON data, do
//
//     final queue = queueFromJson(jsonString);

import 'dart:convert';

Queue queueFromJson(String str) => Queue.fromJson(json.decode(str));

String queueToJson(Queue data) => json.encode(data.toJson());

class Queue {
  Queue({
    this.data,
  });

  Data data;

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.allQueueData,
  });

  List<AllQueueDatum> allQueueData;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    allQueueData: List<AllQueueDatum>.from(json["all_queue_data"].map((x) => AllQueueDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "all_queue_data": List<dynamic>.from(allQueueData.map((x) => x.toJson())),
  };
}

class AllQueueDatum {
  AllQueueDatum({
    this.createDate,
    this.updateDate,
    this.qCode,
    this.unitName,
    this.vn,
  });

  DateTime createDate;
  DateTime updateDate;
  String qCode;
  String unitName;
  String vn;

  factory AllQueueDatum.fromJson(Map<String, dynamic> json) => AllQueueDatum(
    createDate: DateTime.parse(json["create_date"]),
    updateDate: DateTime.parse(json["update_date"]),
    qCode: json["q_code"],
    unitName: json["unit_name"],
    vn: json["vn"],
  );

  Map<String, dynamic> toJson() => {
    "create_date": createDate.toIso8601String(),
    "update_date": updateDate.toIso8601String(),
    "q_code": qCode,
    "unit_name": unitName,
    "vn": vn,
  };
}
