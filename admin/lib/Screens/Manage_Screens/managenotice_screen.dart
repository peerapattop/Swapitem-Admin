import 'package:admin/Screens/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewNotice extends StatefulWidget {
  const ViewNotice({Key? key});

  @override
  State<ViewNotice> createState() => _ViewNoticeState();
}

class _ViewNoticeState extends State<ViewNotice> {
  final notification = TextEditingController();

  final detail = FirebaseFirestore.instance.collection('notifications');

  Future<void> createNotification(TextEditingController notification) async {
    try {
      DateTime now = DateTime.now();

      // เพิ่มข้อมูลลงใน Firestore โดยแยกวันที่และเวลา
      await detail.add({
        "รายละเอียด": notification.text,
        "วันที่": now.year.toString() +
            "-" +
            now.month.toString().padLeft(2, '0') +
            "-" +
            now.day.toString().padLeft(2, '0'),
        "เวลา": now.hour.toString().padLeft(2, '0') +
            ":" +
            now.minute.toString().padLeft(2, '0') +
            ":" +
            now.second.toString().padLeft(2, '0'),
      });
    } catch (e) {
      print('เอ่อเร่อ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppbar("ประกาศแจ้งเตือน"),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
          child: Column(
            children: [
              TextField(
                controller: notification,
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
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  await createNotification(notification);
                  Navigator.pop(context);
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
                  backgroundColor: Colors.green, // สีพื้นหลังของปุ่ม
                  foregroundColor: Colors.white, // สีตัวอักษรในปุ่ม
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
