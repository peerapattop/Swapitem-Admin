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
    fetchDataFromConstructor();
  }

  void fetchDataFromConstructor() {
    paymentNumber = widget.vipData.PaymentNumber;
    id = widget.vipData.id;
    username = widget.vipData.username;
    email = widget.vipData.email;
    firstname = widget.vipData.firstname;
    lastname = widget.vipData.lastname;
    packed = widget.vipData.packed;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppbar('รายละเอียด'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // สั่งให้เนื้อหาชิดซ้าย
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 20),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Colors.blue), // สีขอบของ Container
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(
                        255, 101, 137, 248), // สีพื้นหลังของ Container
                  ),
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          'หลักฐานการโอนเงิน',
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255,
                                  255)), // สีข้อความภายใน Container
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/slip.jpeg',
                        width: 300,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'วัน เวลา',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Icon(Icons.date_range)),
                  controller: TextEditingController(
                    text: formattedDate,
                  ),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'แพ็คเกจ',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(Icons.scatter_plot_rounded),
                  ),
                  controller: TextEditingController(text:packed),
                  maxLines: null, // Allow multiple lines
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'ชื่อผู้ใช้',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: TextEditingController(text: username),
                  maxLines: null, // Allow multiple lines
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'ชื่อ',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: TextEditingController(text: firstname),
                  maxLines: null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'นามสกุล',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(Icons.person),
                  ),
                  controller: TextEditingController(text: lastname),
                  maxLines: null, // Allow multiple lines
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'อีเมล',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Icon(Icons.email),
                  ),
                  controller: TextEditingController(text: email),
                  maxLines: null,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("ยืนยันการปฎิเสธ"),
                              content:
                                  Text("คุณต้องการปฎิเสธข้อมูลนี้ใช่หรือไม่?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("ยกเลิก"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    try {                                  
                                      Navigator.pop(
                                          context); // ปิดหน้าต่างแจ้งเตือน
                                      // ลบสำเร็จแล้ว สามารถแสดงข้อความหรือทำอื่นๆ ต่อได้
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text("ลบข้อมูลสำเร็จ"),
                                            content: Text(
                                                "ข้อมูลได้ถูกลบออกจากฐานข้อมูลแล้ว"),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("ตกลง"),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } catch (e) {
                                      print("เกิดข้อผิดพลาดในการลบข้อมูล: $e");
                                    }
                                  },
                                  child: Text("ยืนยัน"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.close),
                      label: Text('ปฎิเสธ'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VipRequest()),
                        );
                      },
                      icon: Icon(Icons.check), // เพิ่มไอคอน
                      label: Text('ยืนยัน'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green, // สีพื้นหลังของปุ่ม
                        onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
                      ),
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
}
