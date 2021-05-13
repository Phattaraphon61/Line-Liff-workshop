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
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Image.network(
                      'https://cdn.discordapp.com/attachments/834620062090133543/836836380675145758/969312.png',
                      width: 60,
                      height: 60,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'ข้อมูลของฉัน',
                      style: TextStyle(fontSize: 30.0),
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
                  fontSize: 22.0,
                  color: Colors.blue[700],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      color: Colors.blue[700],
                      child: Text(
                        'ข้อมูลเบื้องต้น',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              _CardInfo(data: data)
            ],
          ),
        ),
      ],
    );
  }

  Widget _CardInfo({data}) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue[700]),
      ),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'ชื่อ - สกุล : ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].fullname}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'CID: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].cid}',
                  style: TextStyle(
                    fontSize: 18.0,
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
                  'วันเกิด: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].birth}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'อายุ: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].age} ปี',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'กรุ๊ปเลือด: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].abogroupText}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'เพศ: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].sexText}',
                  style: TextStyle(
                    fontSize: 18.0,
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
                  'ที่อยู่: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].currentAddress}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'HN: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].hn}',
                  style: TextStyle(
                    fontSize: 18.0,
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
                  'ต.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].tambon}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'อ.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].amphur}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'จ.',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].province}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  data[0].currentZipcode,
                  style: TextStyle(
                    fontSize: 18.0,
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
                  'โทรศัพท์: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${data[0].currentAddressTel}',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(width: 10),
                // Text(
                //   ' มือถือ: ${data[0].phone}',
                //   style: TextStyle(
                //     fontSize: 18.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                Text(
                  'สถานะ: ',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'ตรวจแล้ว',
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
