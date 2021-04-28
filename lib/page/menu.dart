import 'package:flutter/material.dart';
import 'package:line_liff/page/appointment.dart';
import 'package:line_liff/page/history.dart';
import 'package:line_liff/page/login.dart';
import 'package:line_liff/page/myinfo.dart';
import 'package:line_liff/page/queue.dart';

class Menu_Page extends StatefulWidget {
  @override
  _Menu_PageState createState() => _Menu_PageState();
}

class _Menu_PageState extends State<Menu_Page> {
  String nameclass = 'Myinfo';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 90),
          child: Text(nameclass),
        ),
      ),
      body:
          // nameclass == "login"? Login_Page():
          nameclass == "History"
              ? History_Page()
              : nameclass == "Myinfo"
                  ? Myinfo_Page()
                  : nameclass == "Appointment"
                      ? Appointment_Page()
                      : nameclass == 'Queue'
                          ? Queue_Page()
                          : Login_Page(),
      drawer: Container(
        width: width * 0.65,
        child: new Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Ashish Rawat"),
                accountEmail: Text("ashishrawat2911@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  child: Text(
                    "B",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "Myinfo";
                  });

                  Navigator.of(context).pop();
                },
                title: Text("ข้อมูลของฉัน"),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "History";
                  });

                  Navigator.of(context).pop();
                },
                title: Text("ประวัติการรักษา"),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "Appointment";
                  });

                  Navigator.of(context).pop();
                },
                title: Text("นัดหมาย"),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                  onTap: () {
                  setState(() {
                    nameclass = "Queue";
                  });

                  Navigator.of(context).pop();
                },
                title: Text("คิวของฉัน"),
                trailing: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
