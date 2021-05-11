import 'package:flutter/material.dart';
import 'package:line_liff/models/Queue.dart';
import 'package:line_liff/models/User.dart';
import 'package:line_liff/services/Network.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Queue_Page extends StatefulWidget {
  @override
  _Queue_PageState createState() => _Queue_PageState();
}

class _Queue_PageState extends State<Queue_Page> {
  @override
  Widget build(BuildContext context) {
    Network.fetchQueue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<User>>(
            // future: Network.fetchQueue(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: _listInfo(data :snapshot.data),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
  Widget _listInfo({List<User> data}){
    return Container(child: Text("text"),);
  }
}
