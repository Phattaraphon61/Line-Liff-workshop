import 'package:flutter/material.dart';
import 'package:line_liff/page/menu.dart';

class Register_Page extends StatefulWidget {
  Register_Page({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Register_PageState createState() => _Register_PageState();
}

class _Register_PageState extends State<Register_Page> {
  @override
  
  Widget _imageProfile(){
    return CircleAvatar(
    radius: 80,
    backgroundImage: NetworkImage('https://www.woolha.com/media/2020/03/eevee.png'),
    backgroundColor: Colors.red,
    );
  }

  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.blue,
      ),
      child: Text(
        'ยืนยัน',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Menu_Page()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'คุณมีบัญชีแล้วหรือไม่ ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              }, 
              child: Text(
              'เข้าสู่ระบบ',
              style: TextStyle(
                  color: Color(0xff376df8),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
              ),
            ),          
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'ลงทะเบียน',
          style: TextStyle(color: Colors.black, fontSize: 30),
          ),
    );
  }

  Widget _UsernamePasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("ชื่อ - สกุล"),
        _entryField("ชื่อผู้ใช้"),
        _entryField("รหัสผ่าน", isPassword: true),
        _entryField("ยืนยันรหัสผ่าน", isPassword: true),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .1),
                    _title(),
                    SizedBox(
                      height: 30,
                    ),
                    _imageProfile(),
                    SizedBox(
                      height: 50,
                    ),
                    _UsernamePasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .1),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}