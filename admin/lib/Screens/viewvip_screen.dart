import 'package:flutter/material.dart';

void main() {
  runApp(ViewVip());
}

class ViewVip extends StatefulWidget {
  const ViewVip({super.key});

  @override
  State<ViewVip> createState() => _ViewVipState();
}

class _ViewVipState extends State<ViewVip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("คำขอสมัคร VIP"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Center(
              child: Image.asset(
                "assets/icons/user.png",
                width: 100,
                height: 100,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "หมายเลขผู้ใช้ : 0001",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "ชื่อ : พีรพัฒน์",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "นามสกุล : ตั้งปัญญาไว",
            style: TextStyle(fontSize: 25),
          ),
          Text(
            "แพ็คเกจ : 30 วัน 50 บาท",
            style: TextStyle(fontSize: 25),
          ),  
          SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // โค้ดที่ต้องการให้ทำเมื่อกดปุ่ม "ปฎิเสธ"
                  },
                  icon: Icon(Icons.close),
                  label: Text("ปฎิเสธ"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(width: 10), // ระยะห่างระหว่างปุ่ม "แก้ไข" และ "ลบ"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    // โค้ดที่ต้องการให้ทำเมื่อกดปุ่ม "ลบ"
                  },
                  icon: Icon(Icons.check),
                  label: Text("ยืนยัน"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
