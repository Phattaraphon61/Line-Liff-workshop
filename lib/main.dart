import 'package:flutter/material.dart';
import 'package:line_liff/page/appointment.dart';
import 'package:line_liff/page/history.dart';
import 'package:line_liff/page/login.dart';
import 'package:line_liff/page/menu.dart';
import 'package:line_liff/page/myinfo.dart';
import 'package:line_liff/page/queue.dart';
import 'package:line_liff/page/register.dart';
import 'package:line_liff/page/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _route = <String, WidgetBuilder>{
      '/register': (BuildContext context) => Register_Page(),
      '/login': (BuildContext context) => Menu_Page(),
    
    };
    return MaterialApp(
      routes: _route,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}
