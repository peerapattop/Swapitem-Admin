import 'dart:async';

import 'package:admin/Screens/Manage_Screens/vipData.dart';
import 'package:admin/Screens/appbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewVip extends StatefulWidget {
  final VipData vipData;

  const ViewVip({super.key, required this.vipData});

  @override
  State<ViewVip> createState() => _ViewVipState();
}

class _ViewVipState extends State<ViewVip> {
  late String paymentNumber;
  late String date;
  late String email;
  late String firstname;
  late String lastname;
  late String image_payment;
  late String status;
  late String time;
  late String id;
  late String uid;
  late String username;
  var packed;
  late String vipuid;
  late String user_uid;
  String formattedDate = '';
  DateTime? confirmationDate;
  Timer? countdownTimer;
  late StreamController<String> countdownController;
  late StreamSubscription<String> countdownSubscription;

  @override
  void initState() {
    super.initState();
    // Initialize countdownController
    countdownController = StreamController<String>();

    // Initialize countdownSubscription with a dummy subscription
    countdownSubscription = StreamController<String>().stream.listen((_) {});

    // ดึงข้อมูลผู้ใช้จาก Firebase Realtime Database
    paymentNumber = widget.vipData.PaymentNumber;
    id = widget.vipData.id;
    user_uid = widget.vipData.user_uid;
    vipuid = widget.vipData.vipuid;
    username = widget.vipData.username;
    email = widget.vipData.email;
    firstname = widget.vipData.firstname;
    lastname = widget.vipData.lastname;
    packed = widget.vipData.packed;
    status = widget.vipData.status;
    image_payment = widget.vipData.image_payment;
    date = widget.vipData.date;
    time = widget.vipData.time;
    confirmationDate = DateTime.now();
  }

  int extractPackedDays(String packedValue) {
    // ดึงค่าจำนวนวันที่จะนับถอยหลัง
    // นำไปใช้ในการกำหนด Duration ในการนับถอยหลัง
    if (packedValue == 'แพ็คเก็จ 1 เดือน : 50 บาท') {
      return 30;
    } else if (packedValue == 'แพ็คเก็จ 2 เดือน : 100 บาท') {
      return 60;
    } else if (packedValue == 'แพ็คเก็จ 3 เดือน : 150 บาท') {
      return 90;
    } else {
      return 30;
    }
  }

  void startCountdown(BuildContext context, String userUid, int packedDays) {
    const oneSecond = Duration(seconds: 1);
    final startRef =
        FirebaseDatabase.instance.ref().child('users/$userUid/startTime');

    // Set the server timestamp at the start of the countdown
    startRef.set(ServerValue.timestamp).catchError((error) {
      print('Error setting start time: $error');
    });

    startRef.once().then((DatabaseEvent event) {
      final serverStartTime = event.snapshot.value;
      if (serverStartTime is int) {
        final serverStartDateTime =
            DateTime.fromMillisecondsSinceEpoch(serverStartTime);

        // Use a Stream for periodic updates
        countdownSubscription = Stream.periodic(oneSecond, (int _) {
          Duration elapsed = DateTime.now().difference(serverStartDateTime);
          Duration remainingTime = Duration(days: packedDays) - elapsed;
          String formattedRemainingTime = formatRemainingTime(remainingTime);

          FirebaseDatabase.instance.ref().child('users/$userUid').update({
            'remainingTime': formattedRemainingTime,
            'postCount': 999,
            'makeofferCount': 999,
          }).then((_) {
            print('Firebase Update Successful');
          }).catchError((error) {
            print('Error updating Firebase: $error');
          });

          return formattedRemainingTime;
        }).listen((String formattedRemainingTime) {
          countdownController.add(formattedRemainingTime);

          // Check if the countdown has finished
          if (DateTime.now()
              .isAfter(serverStartDateTime.add(Duration(days: packedDays)))) {
            // Update Firebase when the countdown finishes
            FirebaseDatabase.instance.ref().child('users/$userUid').update({
              'status_user': 'ผู้ใช้ทั่วไป',
              'postCount': '5',
              'makeofferCount': '5',
            }).catchError((error) {
              print('Error updating Firebase: $error');
            });

            countdownSubscription.cancel();
          }
        });
      } else {
        // Handle the case where serverStartTime is not an int
      }
    }).catchError((error) {
      print('Error getting start time: $error');
    });
  }

  String formatRemainingTime(Duration duration) {
    final days = duration.inDays;
    final hours =
        duration.inHours % 24; // Hours remaining after subtracting days
    final minutes =
        duration.inMinutes % 60; // Minutes remaining after subtracting hours
    final seconds =
        duration.inSeconds % 60; // Seconds remaining after subtracting minutes

    return '$days วัน $hours ชั่วโมง $minutes นาที $seconds วินาที';
  }

  void updateStatusAndNavigate(
      BuildContext context, String userUid, String vipUid) async {
    try {
      await FirebaseDatabase.instance.ref().child('users/$userUid').update({
        'status_user': 'ผู้ใช้พรีเมี่ยม',
      });

      await FirebaseDatabase.instance
          .ref()
          .child('requestvip')
          .child('$vipUid')
          .update({
        'status': 'สำเร็จ',
      });

      // ทำอื่น ๆ ที่คุณต้องการหลังจากอัปเดตข้อมูล

      // นำทางไปยังหน้าที่ต้องการ
      Navigator.pop(context);
    } catch (e) {
      print('Error updating user status: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    countdownSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppbar('รายละเอียด'),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Center(
                              child: Image.network(
                            image_payment,
                            width: 400,
                            height: 400,
                          )),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 216),
                            borderRadius: BorderRadius.circular(
                                12.0), // ทำให้ Container โค้งมน
                          ),
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.tag,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่
                                  Text(
                                    "หมายเลขการชำระเงิน PAY- " + paymentNumber,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.numbers,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่
                                  Text(
                                    'หมายเลขผู้ใช้งาน : ' + id,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่
                                  Text(
                                    'ชื่อผู้ใช้ : ' + username,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่

                                  Text(
                                    " วันที่ : " + date,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.more_time,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่

                                  Text(
                                    " เวลา : " + time,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่

                                  Text(
                                    ' ' + packed,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.handyman,
                                    color: Colors.blue,
                                  ), // เพิ่มไอคอนที่นี่

                                  Text(
                                    ' สถานะ : ' + status,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              onPressed: () async {
                                await FirebaseDatabase.instance
                                    .ref()
                                    .child('requestvip/$uid')
                                    .update({
                                  'status': 'ปฎิเสธ',
                                });
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.clear, color: Colors.white),
                              label: Text(
                                'ปฎิเสธ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 15),
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              onPressed: () {
                                startCountdown(context, user_uid,
                                    extractPackedDays(packed));
                                updateStatusAndNavigate(
                                    context, user_uid, vipuid);
                              },
                              icon:
                                  const Icon(Icons.check, color: Colors.white),
                              label: Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCircularNumberButton(int number) {
    return InkWell(
      onTap: () {
        // โค้ดที่ต้องการให้ทำงานเมื่อปุ่มถูกกด
      },
      child: Container(
        width: 40, // ปรับขนาดตามต้องการ
        height: 40, // ปรับขนาดตามต้องการ
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.black, // สีขอบ
            width: 2.0, // ความกว้างขอบ
          ),
        ),
        child: Center(
          child: Text(
            '$number',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
