import 'package:flutter/material.dart';
import 'package:line_liff/models/Queue.dart';
import 'package:line_liff/models/User.dart';
import 'package:line_liff/models/vn.dart';
import 'package:line_liff/services/Network.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Queue_Page extends StatefulWidget {
  @override
  _Queue_PageState createState() => _Queue_PageState();
}

class _Queue_PageState extends State<Queue_Page> {
  @override
  Widget build(BuildContext context) {
    Network.fetchQueue();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: FutureBuilder<List<QueueDatum>>(
            future: Network.fetchQueue(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: _contentMyQueue(data: snapshot.data),
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

  Widget _contentMyQueue({List<QueueDatum> data}) {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.network(
                'https://media.discordapp.net/attachments/834620062090133543/836834856531918878/3113776.png',
                height: 60.0,
                width: 60.0,
              ),
              SizedBox(width: 20.0),
              Text(
                'คิวของฉัน',
                style: TextStyle(fontSize: 30.0),
              )
            ],
          ),
          SizedBox(height: 5.0),
          Text(
            'รหัสคิว',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          Text(
            data[0].qCode,
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 5.0),
          Text(
            'VN: ${data[0].vn}',
            style: TextStyle(fontSize: 20.0, color: Colors.blue[700]),
          ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'จุดรับบริการ',
                style: TextStyle(
                  fontSize: 20.0,
                    color: Colors.blue[700]
                ),
              ),
              Text(
                'สถานะ',
                style: TextStyle(
                  fontSize: 20.0,
                    color: Colors.blue[700]
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.blue[900],
            thickness: 1.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'จุดคัดกรอง',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              Text(
                data[0].qStatus,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 15.0),
          Row(
            children: [
              Text(
                'สถานที่รับบริการ : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                data[0].unitName,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                'การเตรียมตรวจก่อนพบแพทย์ : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                "- ",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                'สิ่งที่ต้องเตรียม : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                "-",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                'จำนวนคิวที่เหลือ : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                "${data[0].qNum} คิว",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                'เวลาที่จะถึงคิวของท่าน : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                "- นาที",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'ประวัติคิวทั้งหมด ',
            style: TextStyle(fontSize: 22.0),
          ),
          SizedBox(height: 5.0),
          Row(
            children: [
              Text(
                'วันที่ / เวลา : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                '${data[0].createDate.toString().split(".")[0]}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Text(
                'รหัสคิว : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                '${data[0].qCode}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Row(
            children: [
              Text(
                'แผนก : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              Text(
                '${data[0].unitName}',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),

          Row(
            children: [
              Text(
                'ดูเพิ่ม : ',
                style: TextStyle(fontSize: 18.0, color: Colors.blue[700]),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text(
                  "ดูเพิ่มเติม",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 18.0),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
