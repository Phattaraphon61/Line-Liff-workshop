import 'package:flutter/material.dart';
import 'package:line_liff/page/login.dart';
import 'package:line_liff/page/menu.dart';
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
      '/intro': (BuildContext context) => Login_Page(),
    };
    return MaterialApp(
      routes: _route,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}
