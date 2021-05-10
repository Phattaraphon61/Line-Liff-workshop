import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:line_liff/models/Queue.dart';

class Network {
  static Future<List<QueueInfo>> fetchQueue({final hn = "HN6300053"}) async {
    final url = Uri.parse(
        'https://qsnichdev.orchid.thaihis.org/api/public-thai-his/flow-runtime?flow_id=1620373413046950500&hn=${hn}');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      //
      Queue queueList = Queue.fromJson(jsonResponse);

      for(var i = 0;i<queueList.data.queueInfo.length;i++) {
        print(queueList.data.queueInfo[i].fullname);
      }
      print(queueList.data.queueInfo);
      // return QueueList.queueInfo;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
