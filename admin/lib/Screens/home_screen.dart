import 'package:admin/Screens/managepost_screen.dart';
import 'package:admin/Screens/viprequest_screen.dart';
import 'package:flutter/material.dart';
import 'manageuser_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigatorBottom(),
    );
  }
}

// บาร์ด้านล่าง
class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_active), label: 'แจ้งเตือน'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'ตั้งค่า'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("หน้าแรก"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //จัดการข้อมูลผู้ใช้
            Padding(
              padding: const EdgeInsets.only(
                  top: 50.0, left: 50.0, right: 50.0, bottom: 25),
              child: Container(
                child: Center(
                  child: MaterialButton(
                      color: Color.fromARGB(251, 59, 160, 243),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minWidth: 900,
                      height: 110,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ManageUser()),
                        );
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
                      )),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ManagePost()),
                        );
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
                      )),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VipRequest()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'คำขอสมัคร VIP',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      )),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          'ประกาศแจ้งเตือน',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('แจ้งเตือน'),
        centerTitle: true,
      ),
      body: Center(
        child: Text("หน้าแจ้งเตือน"),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่า'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // กำหนดระยะห่างรอบด้านของ Column
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                "assets/icons/software-engineer.png",
                height: 150,
                width: 150,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "admintop@gmail.com",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 290), // กำหนดระยะห่างระหว่างรูปและปุ่ม
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(
                      252, 79, 60, 247), // กำหนดสีพื้นหลังของปุ่ม
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'ออกจากระบบ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
