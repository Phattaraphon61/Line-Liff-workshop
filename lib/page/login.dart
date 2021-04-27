import 'package:flutter/material.dart';
import 'package:line_liff/page/menu.dart';
import 'package:line_liff/page/register.dart';

class Login_Page extends StatefulWidget {
  @override
  _Login_PageState createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final _route = <String, WidgetBuilder>{
    '/register': (BuildContext context) => Register_Page(),
    '/login': (BuildContext context) => Menu_Page(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.black54,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/login');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
