import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:line_liff/models/Queue.dart';
import 'package:line_liff/models/User.dart';
import 'package:line_liff/models/vn.dart';

class Network {
  static Future<List<AllQueueDatum>> fetchAllQueue({final hn = "HN6300053"}) async {
    final url = Uri.parse(
        'https://qsnichdev.orchid.thaihis.org/api/public-thai-his/flow-runtime?flow_id=1620715490000410400&hn=HN6300059');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      //
      Queue allQueue = Queue.fromJson(jsonResponse);

      // for(var i = 0;i<queueList.data.queueInfo.length;i++) {
      //   print(queueList.data.queueInfo[i].fullname);
      // }
      print(allQueue.data.allQueueData[0].vn);
      return allQueue.data.allQueueData;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Future<List<InfoDatum>> fetchUser({final hn = "HN6300053"}) async {
    final url = Uri.parse(
        'https://qsnichdev.orchid.thaihis.org/api/public-thai-his/flow-runtime?flow_id=1620711024050710100&hn=HN6300047');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      //
      User allQueue = User.fromJson(jsonResponse);

      // for(var i = 0;i<queueList.data.queueInfo.length;i++) {
      //   print(queueList.data.queueInfo[i].fullname);
      // }
      print(allQueue.data.infoData[0].fullname);
      return allQueue.data.infoData;
      // return ;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  static Future<List<QueueDatum>> fetchQueue() async {
    final url = Uri.parse(
        'https://qsnichdev.orchid.thaihis.org/api/public-thai-his/flow-runtime?flow_id=1620713319011717700&hn=HN6300061&vn=VN6300354');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      //
      Vn queue = Vn.fromJson(jsonResponse);

      // for(var i = 0;i<queueList.data.queueInfo.length;i++) {
      //   print(queueList.data.queueInfo[i].fullname);
      // }
      print(queue.data.queueData[0]);
      return queue.data.queueData;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}