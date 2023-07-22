import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Image.asset(
              "assets/images/admin.png",
              height: 320,
              width: 350,
              fit: BoxFit.cover,
            ),
            Text(
              "เข้าสู่ระบบ",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'ชื่อผู้ใช้'),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF1F1F1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 15,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'รหัสผ่าน'),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Color.fromARGB(252, 79, 60, 247),
                      onPressed: () {},
                      child: Text(
                        'เข้าสู่ระบบ',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
