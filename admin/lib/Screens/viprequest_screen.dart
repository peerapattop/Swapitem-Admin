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

class VipRequest extends StatefulWidget {
  const VipRequest({super.key});

  @override
  State<VipRequest> createState() => _VipRequestState();
}

class _VipRequestState extends State<VipRequest> {
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
        title: Text("คำขอสมัคร VIP"),
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
          boxDataVip("คำขอที่ 1"),
          boxDataVip("คำขอที่ 2"),
          boxDataVip("คำขอที่ 3"),
          boxDataVip("คำขอที่ 4"),
          boxDataVip("คำขอที่ 5"),
          boxDataVip("คำขอที่ 6"),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
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


Widget boxDataVip(String text) => Container(
      decoration: BoxDecoration(
        color: Colors.lightBlue,
        border: Border.all(
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Text(
        text,
        textScaleFactor: 1.5,
      ),
      width: 100,
      height: 100,
      margin: EdgeInsets.only(top: 10, left: 10, right: 10),
    );


