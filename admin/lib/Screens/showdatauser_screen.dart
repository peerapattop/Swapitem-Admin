import 'package:admin/Screens/manageuser_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
  DateTime date = DateTime.now();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    username = widget.userDocument['username'];
    email = widget.userDocument['email'];
    fname = widget.userDocument['fname'];
    lname = widget.userDocument['lname'];
    gender = widget.userDocument['gender'];
    Timestamp timestamp = widget.userDocument['date'];
    date = timestamp.toDate();
    dateController.text = DateFormat('yyyy-MM-dd').format(date);
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
                padding: const EdgeInsets.only(top: 20,left: 15,right: 15,bottom: 15),
                child: TextField(
                  controller: TextEditingController(text: fname),
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
                  ),
                  onChanged: (value) {
                    setState(() {
                      lname = value;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'เพศ',
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Radio(
                          activeColor: Colors.green,
                          value: "ชาย",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text("ชาย", style: TextStyle(fontSize: 18)),
                        Radio(
                          activeColor: Colors.green,
                          value: "หญิง",
                          groupValue: gender,
                          onChanged: (value) {
                            setState(() {
                              gender = value.toString();
                            });
                          },
                        ),
                        Text("หญิง", style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: TextEditingController(text: username),
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
                  controller: dateController,
                  readOnly: true,
                  onTap: () => _selectDate(context),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'วันเกิด',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    hintStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
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
                          .doc(widget.userDocument.id)
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
                      primary: Colors.green,
                      onPrimary: Colors.white,
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
                                  Navigator.pop(context);
                                },
                                child: Text("ยกเลิก"),
                              ),
                              TextButton(
                                onPressed: () async {
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(widget.userDocument.id)
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
                      primary: Colors.red,
                      onPrimary: Colors.white,
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date, // ให้เริ่มต้นด้วยค่า date ที่มีอยู่
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(date);
      });
    }
  }
}
