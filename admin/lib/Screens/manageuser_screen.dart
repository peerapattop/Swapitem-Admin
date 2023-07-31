
import 'package:admin/Screens/viewuser_screen.dart';
import 'package:flutter/material.dart';

import '../ScreensForHome/home_screen.dart';
import '../ScreensForHome/notice_screen.dart';
import '../ScreensForHome/setting_screen.dart';


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
          createDataTable(context,"650305", "พีรพัฒน์ ตั้งปัญญาไว"),
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

DataTable createDataTable(BuildContext context, String id, String name) {
  return DataTable(
    columnSpacing: 10,
    columns: const [
      DataColumn(label: Text("รหัสผู้ใช้")),
      DataColumn(label: Text("ชื่อ-นามสกุล")),
      DataColumn(label: Text("รายละเอียด")),
    ],
    rows: [
      DataRow(
        cells: [
          DataCell(Text(id)),
          DataCell(Text(name)),
          DataCell(
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ViewUser()),
                );
              },
              child: Image.asset(
                "assets/icons/search.png",
                width: 20,
                height: 20,
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                fixedSize: Size(35, 20),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
