// To parse this JSON data, do
//
//     final queue = queueFromJson(jsonString);

class Queue {
  Queue({
    this.data,
    this.reloadDiv,
  });

  Data data;
  String reloadDiv;

  factory Queue.fromJson(Map<String, dynamic> json) => Queue(
    data: Data.fromJson(json["data"]),
    reloadDiv: json["reload_div"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "reload_div": reloadDiv,
  };
}

class Data {
  Data({
    this.queueInfo,
  });

  List<QueueInfo> queueInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    queueInfo: List<QueueInfo>.from(json["queue_info"].map((x) => QueueInfo.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "queue_info": List<dynamic>.from(queueInfo.map((x) => x.toJson())),
  };
}

class QueueInfo {
  QueueInfo({
    this.qCode,
    this.qStatus,
    this.spCode,
    this.spName,
    this.unitCode,
    this.unitName,
    this.fullname,
    this.qDate,
  });

  String qCode;
  String qStatus;
  String spCode;
  String spName;
  String unitCode;
  String unitName;
  String fullname;
  String qDate;

  factory QueueInfo.fromJson(Map<String, dynamic> json) => QueueInfo(
    qCode: json["q_code"],
    qStatus: json["q_status"],
    spCode: json["sp_code"],
    spName: json["sp_name"],
    unitCode: json["unit_code"],
    unitName: json["unit_name"],
    fullname: json["fullname"],
    qDate: json["q_date"],
  );

  Map<String, dynamic> toJson() => {
    "q_code": qCode,
    "q_status": qStatus,
    "sp_code": spCode,
    "sp_name": spName,
    "unit_code": unitCode,
    "unit_name": unitName,
    "fullname": fullname,
    "q_date": qDate,
  };
}
