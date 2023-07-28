import 'package:flutter/material.dart';

void main() {
  runApp(EditUser());
}

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("จัดการข้อมูลผู้ใช้"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: Image.asset(
                "assets/icons/user.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
