import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/main_page.dart';
import 'package:admin/ScreensForHome/home_screen.dart';
import 'package:flutter/material.dart';

class ViewNotice extends StatefulWidget {
  const ViewNotice({Key? key});

  @override
  State<ViewNotice> createState() => _ViewNoticeState();
}

class _ViewNoticeState extends State<ViewNotice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar("ประกาศแจ้งเตือน"),
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
            ),
            SizedBox(height: 20), // เพิ่มระยะห่างระหว่าง TextField และปุ่ม
            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Container(
                  width: 90,
                  height: 40,
                  child: Center(
                      child: Text(
                    'ส่ง',
                    style: TextStyle(fontSize: 20),
                  ))),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, // สีพื้นหลังของปุ่ม
                onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
              ),
            ),
          ],
        ),
      ),
    );
  }
}
