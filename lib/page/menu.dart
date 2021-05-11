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
  String nameclass = 'ข้อมูลของฉัน';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(nameclass),
      ),
      body:
          // nameclass == "login"? Login_Page():
          nameclass == "ประวัติการรักษา"
              ? History_Page()
              : nameclass == "ข้อมูลของฉัน"
                  ? Myinfo_Page()
                  : nameclass == "นัดหมาย"
                      ? Appointment_Page()
                      : nameclass == 'คิวของฉัน'
                          ? Queue_Page()
                          : Login_Page(),
      drawer: Container(
        width: width * 0.65,
        child: new Drawer(
          child: ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Anucha Ar'art"),
                accountEmail: Text("anucha.su.61@ubu.ac.th"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://scontent.fbkk10-1.fna.fbcdn.net/v/t1.6435-9/48382402_1468943199904553_3400320523001921536_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHY85MVTqs1ShEH-UPqxBs-Af2gYIqEY5AB_aBgioRjkKoJDOtnKEqTvne5xFU3zcTxhMnAeXV0tRC5C2NojcMC&_nc_ohc=vfoZGIsrVfEAX_W28m6&_nc_ht=scontent.fbkk10-1.fna&oh=a6e4d6829e3418e438edd12f71971e07&oe=60B07736'),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "ข้อมูลของฉัน";
                  });

                  Navigator.of(context).pop();
                },
                leading: Image.network(
                  'https://cdn.discordapp.com/attachments/834620062090133543/836836380675145758/969312.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "ข้อมูลของฉัน",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "ประวัติการรักษา";
                  });

                  Navigator.of(context).pop();
                },
                leading: Image.network(
                  'https://media.discordapp.net/attachments/834620062090133543/836834745303826472/3601157.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "ประวัติการรักษา",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "นัดหมาย";
                  });

                  Navigator.of(context).pop();
                },
                leading: Image.network(
                  'https://media.discordapp.net/attachments/834620062090133543/836835672051417128/3652191.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "นัดหมาย",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    nameclass = "คิวของฉัน";
                  });

                  Navigator.of(context).pop();
                },
                leading: Image.network(
                  'https://media.discordapp.net/attachments/834620062090133543/836834856531918878/3113776.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "คิวของฉัน",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Icon(Icons.arrow_forward),
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/login", (route) => false);
                },
                leading: Image.network(
                  'https://media.discordapp.net/attachments/834620062090133543/837178484370571274/logout.png',
                  width: 30,
                  height: 30,
                ),
                title: Text(
                  "ออกจากระบบ",
                  style: TextStyle(fontSize: 18, color: Colors.redAccent[700]),
                ),
                trailing: Icon(
                  Icons.arrow_forward,
                  color: Colors.redAccent[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
