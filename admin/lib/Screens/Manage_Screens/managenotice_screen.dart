import 'dart:convert';
import 'package:http/http.dart' as http;

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
    String formattedDate = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
    String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";

    // Add the notification details to Firestore
    await detail.add({
      "รายละเอียด": notification.text,
      "วันที่": formattedDate,
      "เวลา": formattedTime,
    });

    // Construct the notification message
    var fcmMessage = {
      "notification": {
        "title": "New Notification",
        "body": notification.text,
      },
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "1",
        "status": "done",
      },
      "to": "/topics/all", // Assuming you want to send to all users subscribed to the 'all' topic
    };

    // Send the notification message to FCM
    var response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'AAAAR-udywc:APA91bGdzs6jsxwDPwOjAizowJRfa09c2FgOw4VxabbPKmoftcBSm8BahlBkkrGm8znVYaSUsab2_TpFsbwBIBPMKXQEyL1k0OrmnjPRNtx2H7hSCEo3fY5CDPbhRYHZRyHqqmxX8oK8', // Replace with your server key from Firebase Console
      },
      body: jsonEncode(fcmMessage),
    );

    print("FCM request for device sent!");
  } catch (e) {
    print('Error: $e');
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
              Image.asset('assets/images/Megaphone.png',width: 250,),
              SizedBox(height: 40,),
              TextField(
                controller: notification,
                maxLines: 3,
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
