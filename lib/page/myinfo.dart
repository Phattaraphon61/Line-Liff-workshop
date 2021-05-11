import 'package:flutter/material.dart';
import 'package:line_liff/services/Network.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Myinfo_Page extends StatefulWidget {
  @override
  _Myinfo_PageState createState() => _Myinfo_PageState();
}

class _Myinfo_PageState extends State<Myinfo_Page> {
  @override
  Widget build(BuildContext context) {
    Network.UserInfo();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WebView(
          initialUrl: "https://youtube.com",
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
