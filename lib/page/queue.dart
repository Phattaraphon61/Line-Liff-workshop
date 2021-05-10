import 'package:flutter/material.dart';
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
        body: WebView(
          initialUrl: "https://pub.dev/",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
