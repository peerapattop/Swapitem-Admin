import 'package:flutter/material.dart';

void main() {
  runApp(HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Peerapat"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("จัดการข้อมูลผู้ใช้"),
              Text("จัดการโพสต์"),
              Text("คำขอสมัคร VIP"),
              Text("ประกาศแจ้งเตือน"),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'หน้าแรก'),
            BottomNavigationBarItem(icon: Icon(Icons.notifications_active),label: 'แจ้งเตือน'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'ตั้งค่า'),
          ],
        ),
      ),
    );
  }
}
