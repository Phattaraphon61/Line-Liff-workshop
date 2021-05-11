import 'package:flutter/material.dart';
import 'package:line_liff/models/Queue.dart';
import 'package:line_liff/services/Network.dart';
import '../models/User.dart';
import '../services/Network.dart';

class Myinfo_Page extends StatefulWidget {
  @override
  _Myinfo_PageState createState() => _Myinfo_PageState();
}

class _Myinfo_PageState extends State<Myinfo_Page> {
  @override
  Widget build(BuildContext context) {
    Network.fetchUser();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Text("test"),

        //   child: FutureBuilder<List<QueueInfo>>(
        //     // future: Network.fetchQueue(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return Container(
        //           child: _listInfo(data :snapshot.data),
        //         );
        //       } else if (snapshot.hasError) {
        //         return Text('${snapshot.error}');
        //       }
        //       return CircularProgressIndicator();
        //     },
        //   ),
        // ),
      ),
    );
  }
  // Widget _listInfo({List<QueueInfo> data}){
  //   return Container(child: Text(data[0].fullname),);
  // }
}
