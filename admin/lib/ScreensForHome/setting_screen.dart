import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
              const SizedBox(
                height: 20,
              ),
              const Text(
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
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
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