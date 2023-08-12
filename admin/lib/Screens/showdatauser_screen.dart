import 'package:admin/Screens/manageuser_screen.dart';
import 'package:admin/ScreensForHome/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowDataUser extends StatefulWidget {
  final DocumentSnapshot userDocument;

  ShowDataUser(this.userDocument);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<ShowDataUser> {
  late String? username;
  late String email;
  late String fname;
  late String lname;
  late String gender;
  late String date;

  @override
  void initState() {
    super.initState();
    username = widget.userDocument['username'];
    email = widget.userDocument['email'];
    fname = widget.userDocument['fname'];
    lname = widget.userDocument['lname'];
    gender = widget.userDocument['gender'];
    date = widget.userDocument['date'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายละเอียดผู้ใช้"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: TextEditingController(text: username),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ชื่อผู้ใช้', // ตรงนี้เป็น labelText
                  ),
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: TextEditingController(text: email),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'อีเมล', // ตรงนี้เป็น labelText
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: TextEditingController(text: fname),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'ชื่อ',
                  ),
                  onChanged: (value) {
                    setState(() {
                      fname = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: TextEditingController(text: lname),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'นามสกุล',
                  ),
                  onChanged: (value) {
                    setState(() {
                      lname = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  "เพศ",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              ListTile(
                title: const Text('ชาย'),
                leading: Radio(
                  value: 'ชาย',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 0.001,
              ),
              ListTile(
                title: const Text('หญิง'),
                leading: Radio(
                  value: 'หญิง',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: TextEditingController(text: date),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'วันเกิด', // ตรงนี้เป็น labelText
                  ),
                  onChanged: (value) {
                    setState(() {
                      date = value;
                    });
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.save),
                    onPressed: () async {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(widget
                              .userDocument.id) // ระบุเอกสารที่ต้องการอัปเดต
                          .update({
                        'username': username,
                        'email': email,
                        'fname': fname,
                        'lname': lname,
                        'gender': gender,
                        'date': date,
                      });
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => ManageUser()),
                      );
                    },
                    label: Text("บันทึกการแก้ไข"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // สีพื้นหลังของปุ่ม
                      onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("ยืนยันการลบ"),
                            content: Text("คุณต้องการลบข้อมูลนี้ใช่หรือไม่?"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // ปิดกล่องตัวสอบ
                                },
                                child: Text("ยกเลิก"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(widget.userDocument
                                            .id) // ระบุเอกสารที่ต้องการลบ
                                        .delete();
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ManageUser()),
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
                    label: Text("ลบข้อมูล"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red, // สีพื้นหลังของปุ่ม
                      onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
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
