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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("ชื่อผู้ใช้: $username"),
            Text("อีเมล: $email"),
            // ... เพิ่มข้อมูลอื่น ๆ ตามต้องการ ...
          ],
        ),
      ),
    );
  }
}
