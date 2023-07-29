import 'package:flutter/material.dart';

void main() {
  runApp(ViewPost());
}

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("จัดการโพสต์"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/shoestest.jpg",
            width: 250,
            height: 250,
          ),
          dataPost("วัน/เดือน/ปี : 20 มกราคม 2566"),
          dataPost("รหัสโพสต์ : 0001"),
          dataPost("ชื่อผู้โพสต์ : พีรพัฒน์ ตั้งปัญญาไว"),
          dataPost("ชื่อสิ่งของ : รองเท้า"),
          dataPost(
              "รายละเอียด: รองเท้าหุ้มส้น Adidas รุ่น MB209 สีชมพู สภาพ 90% มีรอยตรงส้น"),
          dataPost("สถานที่แลกเปลี่ยน: สถานีรถไฟฟ้าอโศก"),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  // โค้ดที่ต้องการให้ทำเมื่อกดปุ่ม "ลบ"
                },
                icon: Icon(Icons.delete),
                label: Text("ลบ"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          ),     
        ],
      ),
    );
  }

  Widget dataPost(String text) => Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
      );
}
