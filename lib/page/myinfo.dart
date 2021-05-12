import 'package:flutter/material.dart';
import 'package:line_liff/models/User.dart';
import 'package:line_liff/services/Network.dart';
import '../models/User.dart';
import '../services/Network.dart';

class Myinfo_Page extends StatefulWidget {
  @override
  _Myinfo_PageState createState() => _Myinfo_PageState();
}

class _Myinfo_PageState extends State<Myinfo_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<InfoDatum>>(
            future: Network.fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: _listInfo(data: snapshot.data),
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

  Widget _listInfo({List<InfoDatum> data}) {
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    children: [
                      Image.network(
                        'https://cdn.discordapp.com/attachments/834620062090133543/836836380675145758/969312.png',
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(width: 20),
                      Text(
                        'ข้อมูลของฉัน',
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontStyle: FontStyle.normal,
                            fontSize: 23.0),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'HN: ${data[0].hn}\n'
                  'AN: ${data[0].hn}',
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Text(
                  'ข้อมูลเบื้องต้น',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'ชื่อ - สกุล: ${data[0].fullname}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'CID: ${data[0].cid}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      'วันเกิด: ${data[0].birth}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'อายุ: ${data[0].age} ปี',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'กรุ๊ปเลือด: ${data[0].abogroupText}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'เพศ: ${data[0].sexText}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      'ที่อยู่: ${data[0].currentAddress}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'HN: ${data[0].hn}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      'ต. ${data[0].currentTambon}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'อ. ${data[0].currentAmphur}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'จ. ${data[0].currentProvince}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      data[0].currentZipcode,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      'โทรศัพท์: ${data[0].currentAddressTel}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      ' มือถือ: ${data[0].phone}',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      'สถานะ: ตรวจแล้ว',
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
