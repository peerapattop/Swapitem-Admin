import 'package:flutter/material.dart';

import 'home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManageUser(),
    );
  }
}

class ManageUser extends StatefulWidget {
  const ManageUser({super.key});

  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  int myIndex = 0;
  String _searchText = '';

  final List<Widget> _pages = [
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("จัดการข้อมูลผู้ใช้"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(width: 0.8),
                ),
                hintText: "ค้นหา",
                prefixIcon: Icon(
                  Icons.search,
                  size: 30,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          boxLabel(),
          boxDataUser("ข้อมูลคนที่ 1"),
          boxDataUser("ข้อมูลคนที่ 2"),
          boxDataUser("ข้อมูลคนที่ 3"),
          boxDataUser("ข้อมูลคนที่ 4"),
          boxDataUser("ข้อมูลคนที่ 5"),
          boxDataUser("ข้อมูลคนที่ 6"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: 'แจ้งเตือน'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'ตั้งค่า'),
        ],
      ),
    );
  }
}

Widget boxDataUser(String text) => Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        border: Border.all(
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
      width: 100,
      height: 100,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
    );

Widget boxLabel() => Container(
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          width: 1,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Text("ไอดี"),                         
            ),
          ),
        ],
      ),
      width: 100,
      height: 50,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
    );
