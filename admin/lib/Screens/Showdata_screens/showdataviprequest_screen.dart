import 'package:admin/Screens/Manage_Screens/VipData.dart';
import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/Manage_Screens/manageviprequest_screen.dart';
import 'package:flutter/material.dart';

class ViewVip extends StatefulWidget {
  final VipData vipData;

  ViewVip({required this.vipData});

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
  late String username;
  late String packed;
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    // ดึงข้อมูลผู้ใช้จาก Firebase Realtime Database
    paymentNumber = widget.vipData.PaymentNumber;
    id = widget.vipData.id;
    username = widget.vipData.username;
    email = widget.vipData.email;
    firstname = widget.vipData.firstname;
    lastname = widget.vipData.lastname;
    packed = widget.vipData.packed;
    status = widget.vipData.status;
    image_payment = widget.vipData.image_payment;
    date = widget.vipData.date;
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
                              child: Image.asset(
                            "assets/images/slip.jpeg",
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
                                    'หมายเลขผู้ใช้งาน : '+id,
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
                                    'ชื่อผู้ใช้ : '+username,
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
                                    " วันที่ : 28/9/2566",
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
                                    " เวลา : 08:38 น.",
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
                              onPressed: () {
                                //
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
                              onPressed: () {},
                              icon: const Icon(Icons.check,
                                  color: Colors.white),
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
