import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowDataPost extends StatefulWidget {
  final DocumentSnapshot postDocument;

  ShowDataPost(this.postDocument);

  @override
  State<ShowDataPost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShowDataPost> {
  late String username;
  // late String email;
  // late String fname;
  // late String lname;
  // late String gender;
  late String? date;

  @override
  void initState() {
    super.initState();
    username = widget.postDocument['username'];
    // email = widget.userDocument['email'];
    // fname = widget.userDocument['fname'];
    // lname = widget.userDocument['lname'];
    // gender = widget.userDocument['gender'];
    date = widget.postDocument['time']?.toDate().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แสดงข้อมูลโพสต์"),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: TextEditingController(text: username),
            decoration: InputDecoration(
              labelText: 'ชื่อผู้ใช้', // ตรงนี้เป็น labelText
              border: UnderlineInputBorder(
                // กำหนดเฉพาะขอบด้านล่าง
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: TextEditingController(text: date),
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'วันที่โพสต์', // ตรงนี้เป็น labelText
              border: UnderlineInputBorder(
                // กำหนดเฉพาะขอบด้านล่าง
                borderSide: BorderSide(color: Colors.grey),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
