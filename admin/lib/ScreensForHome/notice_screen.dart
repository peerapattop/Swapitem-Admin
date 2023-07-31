import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: NotificationsScreen(),
    ),
  );
}

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประกาศแจ้งเตือน'),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                  hintText:
                      'กรอกข้อความที่นี่', // ข้อความให้แสดงเมื่อไม่มีข้อมูล
                  fillColor: Colors.grey[300], // สีพื้นหลังของ TextField
                  filled: true, // ให้เต็มพื้นที่หรือไม่
                  border: OutlineInputBorder(
                    // สร้างเส้นขอบรอบ TextField
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดความโค้งของเส้นขอบ
                    borderSide: BorderSide.none, // ไม่มีเส้นขอบด้านนอก
                  ),
                  contentPadding: EdgeInsets.all(
                      12), // ระยะห่างของข้อความกับขอบของ TextField
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {},
                child: Text('ส่ง'),
              ),
            ],
          )),
    );
  }
}
