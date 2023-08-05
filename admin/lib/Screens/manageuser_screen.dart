import 'package:admin/Screens/viewuser_screen.dart';
import 'package:flutter/material.dart';

import '../ScreensForHome/home_screen.dart';
import '../ScreensForHome/notice_screen.dart';
import '../ScreensForHome/setting_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:cloud_firestore/cloud_firestore.dart';

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

  final List<Widget> _pages = [
    const HomeScreen(),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("ไม่มีข้อมูล"),
            );
          }

          return Column(
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
                    prefixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(
                        Icons.clear,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              //แสดงข้อมูลผู้ใช้
              Expanded(
                child: ListView(
                  children: snapshot.data!.docs.map((document) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.all(5),
                      child: ListTile(
                        title: Text(document['username']),
                        subtitle: Text(document['email']),
                        leading: CircleAvatar(
                          child: FittedBox(
                            child: Text("ผู้ใช้"),
                          ),
                        ),
                        trailing: ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            "assets/icons/search.png",
                            width: 18,
                            height: 18,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 46, 246, 32),
                            fixedSize: Size(35, 20),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          );
        },
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
