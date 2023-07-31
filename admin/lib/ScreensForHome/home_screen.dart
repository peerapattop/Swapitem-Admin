import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../ScreensForHome/setting_screen.dart';
import '../ScreensForHome/notice_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreenContent(), // แก้เป็นหน้าจอจัดการข้อมูลผู้ใช้
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("หน้าแรก"),
        centerTitle: true,
      ),
      body: _pages[_currentIndex], // เปลี่ยนการเรียกใช้หน้าจอโดยใช้ _currentIndex
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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

class HomeScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //จัดการข้อมูลผู้ใช้
            Padding(
              // คอนเทนเนอร์สำหรับจัด Button
              padding: const EdgeInsets.only(
                  top: 20.0, left: 50.0, right: 50.0, bottom: 25),
              child: Container(
                child: Center(
                  child: MaterialButton(
                    color: Color.fromARGB(251, 59, 160, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: 900,
                    height: 110,
                    onPressed: () {
                      // ทำอะไรสักอย่างเมื่อกดปุ่ม
                      // ในที่นี้คือไม่ต้องทำอะไรเพิ่มเติมเนื่องจากหน้าจอคือหน้านี้แล้ว
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'จัดการข้อมูลผู้ใช้',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //จัดการโพสต์
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 50.0, right: 50.0, bottom: 25),
              child: Container(
                child: Center(
                  child: MaterialButton(
                    color: Color.fromARGB(251, 59, 160, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: 900,
                    height: 110,
                    onPressed: () {
                      // ทำอะไรสักอย่างเมื่อกดปุ่ม
                      // ในที่นี้คือไม่ต้องทำอะไรเพิ่มเติมเนื่องจากไม่มีหน้าจอจัดการโพสต์
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'จัดการโพสต์',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //คำขอสมัคร VIP
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 50.0, right: 50.0, bottom: 25),
              child: Container(
                child: Center(
                  child: MaterialButton(
                    color: Color.fromARGB(251, 59, 160, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: 900,
                    height: 110,
                    onPressed: () {
                      // ทำอะไรสักอย่างเมื่อกดปุ่ม
                      // ในที่นี้คือไม่ต้องทำอะไรเพิ่มเติมเนื่องจากไม่มีหน้าจอคำขอสมัคร VIP
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'คำขอสมัคร VIP',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //ประกาศแจ้งเตือน
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 50.0, right: 50.0, bottom: 25),
              child: Container(
                child: Center(
                  child: MaterialButton(
                    color: Color.fromARGB(251, 59, 160, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: 900,
                    height: 110,
                    onPressed: () {
                      // ทำอะไรสักอย่างเมื่อกดปุ่ม
                      // ในที่นี้คือไม่ต้องทำอะไรเพิ่มเติมเนื่องจากไม่มีหน้าจอประกาศแจ้งเตือน
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'ประกาศแจ้งเตือน',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 50.0, right: 50.0, bottom: 25),
              child: Container(
                child: Center(
                  child: MaterialButton(
                    color: Color.fromARGB(251, 59, 160, 243),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    minWidth: 900,
                    height: 110,
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'ออกจากระบบ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
