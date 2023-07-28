import 'package:flutter/material.dart';
import 'home_screen.dart';

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

class Notice extends StatefulWidget {
  const Notice({super.key});

  @override
  State<Notice> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  TextEditingController _textEditingController = TextEditingController();
  int myIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    NotificationsScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ประกาศแจ้งเตือน"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _textEditingController,
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: 'กรอกข้อความ',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                bottom: 400), // กำหนดระยะห่างระหว่างข้อความและปุ่ม
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(252, 79, 60, 247),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'ยืนยัน',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
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
