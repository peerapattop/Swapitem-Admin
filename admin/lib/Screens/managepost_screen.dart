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

class ManagePost extends StatefulWidget {
  const ManagePost({super.key});

  @override
  State<ManagePost> createState() => _ManagePostState();
}

class _ManagePostState extends State<ManagePost> {
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
        title: Text("จัดการโพสต์"),
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
          DataTable(
            columnSpacing: 10,
            columns: [
              DataColumn(label: Text("รหัสโพสต์")),
              DataColumn(
                label: Text("ชื่อ-นามสกุล"),
              ),
              DataColumn(label: Text("รายละเอียด")),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(Text("650305")),
                  DataCell(Text("พีรพัฒน์ ตั้งปัญญาไว")),
                  DataCell(
                    ElevatedButton(
                      onPressed: () {
                        // โค้ดที่ต้องการให้ทำเมื่อกดปุ่มที่สอง
                      },
                      child: Image.asset(
                        "assets/icons/search.png",
                        width: 20,
                        height: 20,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey,
                        fixedSize: Size(35, 20),
                      ), // ข้อความปุ่มที่สอง
                    ),
                  ),
                ],
              ),
            ],
            
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

