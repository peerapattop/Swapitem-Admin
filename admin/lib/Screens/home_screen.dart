import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        child: _pages[
            _currentIndex], // ย้าย _pages[_currentIndex] ไปเป็น body ของ Scaffold
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => NotificationsScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          }
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
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 50.0, left: 50.0, right: 50.0, bottom: 25),
            child: Container(
              child: Center(
                child: Text(
                  "จัดการข้อมูลผู้ใช้",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 1.0, left: 50.0, right: 50.0, bottom: 25),
            child: Container(
              child: Center(
                child: Text(
                  "จัดการโพสต์",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0, left: 50.0, right: 50.0),
            child: Container(
              child: Center(
                child: Text(
                  "คำขอสมัคร VIP",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 50.0, right: 50.0),
            child: Container(
              child: Center(
                child: Text(
                  "ประกาศแจ้งเตือน",
                  style: TextStyle(fontSize: 28),
                ),
              ),
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      )),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('noti'),
      ),
      body: Text(
        'หน้าแจ้งเตือน',
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("หน้าตั้งค่า"),
    );
  }
}
