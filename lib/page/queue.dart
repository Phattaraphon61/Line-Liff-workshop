import 'package:flutter/material.dart';
import 'package:line_liff/models/Queue.dart';
import 'package:line_liff/services/Network.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Queue_Page extends StatefulWidget {
  @override
  _Queue_PageState createState() => _Queue_PageState();
}

class _Queue_PageState extends State<Queue_Page> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: FutureBuilder<List<QueueInfo>>(
            future: Network.fetchQueue(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return 
                  _listInfo(data :snapshot.data);
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
  Widget _listInfo({List<QueueInfo> data}){
    return 
      // padding: const EdgeInsets.all(8.0),
      Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children :[
                  Image.network(
                    'https://media.discordapp.net/attachments/834620062090133543/836834856531918878/3113776.png',
                    width: 30,
                    height: 30,
                ),
                Text('คิวของฉัน',style: TextStyle(fontSize: 28)),
              ],
            ), 
            Text('รหัสคิว',style: TextStyle(fontSize: 24)),
            Text(data[0].qCode,style: TextStyle(fontSize: 18),),
            Text('VN : ',style: TextStyle(fontSize: 24,color: Colors.blue)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text('จุดบริการ',style: TextStyle(fontSize: 18,color: Colors.blue)),
              Text('สถานะ',style: TextStyle(fontSize: 18,color: Colors.blue)),
              ],
            ),

            Divider(thickness: 2,color: Colors.blue),
            // Text(data),
            // Text(data),

            Text('สถานที่รับบริการ : ',style: TextStyle(fontSize: 20)),
            Text('การเตรียมตัวก่อนพบแพทย์ : ',style: TextStyle(fontSize: 20)),
            Text('สิ่งที่ต้องเตรียม : ',style: TextStyle(fontSize: 20)),
            Text('จำนวนคิวที่เหลือ : ',style: TextStyle(fontSize: 20)),
            Text('เวลาที่จะถึงคิวของท่าน : ',style: TextStyle(fontSize: 20)),

            Text('ประวัติคิวทั้งหมด',style: TextStyle(fontSize: 24)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text('วันที่',style: TextStyle(fontSize: 18,color: Colors.blue)),
              Text('เวลา',style: TextStyle(fontSize: 18,color: Colors.blue)),
              Text('รหัสคิว',style: TextStyle(fontSize: 18,color: Colors.blue)),
              Text('แผนก',style: TextStyle(fontSize: 18,color: Colors.blue)),
              Text('ดูเพิ่ม',style: TextStyle(fontSize: 18,color: Colors.blue)),
              ],
            ),
            // Text(data)
            Divider(thickness: 2,color: Colors.blue),
            
          ],
        ),
      );
  }
}
