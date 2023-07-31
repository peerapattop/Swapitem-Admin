import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/admin.png",
                  height: 320,
                  width: 350,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 20,
                  ),
                  child: const Text(
                    "ยินดีต้อนรับ",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
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
                      controller: _emailController,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'อีเมล'),
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
                      controller: _passwordController,
                      obscureText: true, //กำหนดให้ Password มองไม่เห็น
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: 'รหัสผ่าน'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //ปุ่มเข้าสู่ระบบ
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 20,
                  ),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "เข้าสู่ระบบ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
