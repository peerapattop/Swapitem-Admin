import 'package:flutter/material.dart';

class ViewNotice extends StatefulWidget {
  const ViewNotice({Key? key});

  @override
  State<ViewNotice> createState() => _ViewNoticeState();
}

class _ViewNoticeState extends State<ViewNotice> {
  String enteredText = ''; // สำหรับเก็บข้อความที่ผู้ใช้กรอก

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ประกาศแจ้งเตือน'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
        child: Column(
          children: [
            TextField(
              maxLines: 10,
              decoration: InputDecoration(
                hintText: 'กรอกข้อความที่นี่',
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(12),
              ),
              onChanged: (text) {
                setState(() {
                  enteredText = text;
                });
              },
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง TextField และปุ่ม
            ElevatedButton(
              onPressed: () {
                // ดำเนินการเมื่อปุ่มถูกกด
                // คุณสามารถเพิ่มโค้ดที่คุณต้องการทำเมื่อกดปุ่มนี้
              },
              
              child: Text('ส่ง'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // สีพื้นหลังของปุ่ม
                onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
              ),
            ),
            Text(
              'ข้อความที่กรอก: $enteredText',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
