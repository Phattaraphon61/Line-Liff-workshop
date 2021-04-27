import 'package:flutter/material.dart';

class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          color: Colors.black54,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, '/intro', (Route<dynamic> route) => false);
          },
          child: Text('go to login'),
        ),
      ),
    );
  }
}
