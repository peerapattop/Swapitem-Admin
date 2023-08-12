import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowDataUser extends StatefulWidget {
  final DocumentSnapshot userDocument;

  ShowDataUser(this.userDocument);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<ShowDataUser> {
  late String username;
  late String email;

  @override
  void initState() {
    super.initState();
    username = widget.userDocument['username'];
    email = widget.userDocument['email'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายละเอียดผู้ใช้"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: TextEditingController(text: username),
                decoration: InputDecoration(labelText: "ชื่อผู้ใช้"),
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
                decoration: InputDecoration(labelText: "อีเมล"),
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    // ดำเนินการบันทึกการแก้ไขข้อมูลได้ตรงนี้
                  },
                  label: Text("บันทึกการแก้ไข"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // สีพื้นหลังของปุ่ม
                    onPrimary: Colors.white, // สีตัวอักษรในปุ่ม
                  ),
                ),
                SizedBox(width: 15,),
                ElevatedButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // ดำเนินการลบข้อมูลได้ตรงนี้
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
    );
  }
}
