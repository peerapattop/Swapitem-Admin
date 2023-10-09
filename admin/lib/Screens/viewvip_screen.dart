import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/viprequest_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ViewVip extends StatefulWidget {
  final DocumentSnapshot viprequestsDocument;

  ViewVip(this.viprequestsDocument);

  @override
  State<ViewVip> createState() => _ViewVipState();
}

class _ViewVipState extends State<ViewVip> {
  late String username;
  late String email;
  late String fname;
  late String lname;
  late String gender;
  late String order;
  String formattedDate = '';

  @override
  void initState() {
    super.initState();
    username = widget.viprequestsDocument['username'];
    email = widget.viprequestsDocument['email'];
    fname = widget.viprequestsDocument['fname'];
    lname = widget.viprequestsDocument['lname'];
    gender = widget.viprequestsDocument['gender'];
    Timestamp timestamp = widget.viprequestsDocument['date'];
    DateTime dateTime = timestamp.toDate();
   formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss a').format(dateTime);

    order = widget.viprequestsDocument['order'];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:MyAppbar('รายละเอียด'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // สั่งให้เนื้อหาชิดซ้าย
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15, left: 10),
                child: Center(child: Image.asset('assets/images/slip.jpeg',width: 300,)),
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
                    prefixIcon: Icon(Icons.date_range)
                  ),
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
                    prefixIcon: Icon(Icons.scatter_plot_rounded ),
                  ),
                  controller: TextEditingController(text: order),
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
                    prefixIcon: Icon(Icons.person ),
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
                    prefixIcon: Icon(Icons.person ),
                  ),
                  controller: TextEditingController(text: fname),
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
                    prefixIcon: Icon(Icons.person ),
                  ),
                  controller: TextEditingController(text: lname),
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
                    prefixIcon: Icon(Icons.email ),
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
                                      await FirebaseFirestore.instance
                                          .collection('vip_requests')
                                          .doc(widget.viprequestsDocument.id)
                                          .delete();
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
