import 'package:admin/Screens/managepost_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowDataPost extends StatefulWidget {
  final DocumentSnapshot postDocument;

  ShowDataPost(this.postDocument);

  @override
  State<ShowDataPost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShowDataPost> {
  late String username;
  // late String email;
  // late String fname;
  // late String lname;
  // late String gender;
  late String date;
  late String idposts;
  late String nameobj;
  late String detailpost;
  late String swapwith;
  late String detailoffer;
  late String location;

  @override
  void initState() {
    super.initState();
    idposts = widget.postDocument.id;
    nameobj = widget.postDocument['nameobj'];
    username = widget.postDocument['username'];
    detailpost = widget.postDocument['detailpost'];
    swapwith = widget.postDocument['swapwith'];
    detailoffer = widget.postDocument['detailoffer'];
    location = widget.postDocument['location'];
    date = widget.postDocument['time']?.toDate().toString() ?? '';
  }

  Widget ShowDataPosts(String label, String data) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label : ",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            TextSpan(
              text: data,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("แสดงข้อมูลโพสต์"),
          centerTitle: true,
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Text("รูปภาพ"),
            ),
          ),
          ShowDataPosts("หมายเลขโพสต์", idposts),
          ShowDataPosts("วัน เวลาที่โพสต์", date),
          ShowDataPosts("ชื่อผู้โพสต์", username),
          ShowDataPosts("ชื่อสิ่งของ", nameobj),
          ShowDataPosts("รายละเอียด", detailpost),
          ShowDataPosts("ต้องการแลกเปลี่ยนกับ", swapwith),
          ShowDataPosts("รายละเอียด", detailoffer),
          ShowDataPosts("สถานที่แลกเปลี่ยน", location),
          Center(
            child: SingleChildScrollView(
              child: ElevatedButton.icon(
                icon: Icon(Icons.delete),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("ยืนยันการลบ"),
                        content: Text("คุณต้องการลบข้อมูลนี้ใช่หรือไม่?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("ยกเลิก"),
                          ),
                          TextButton(
                            onPressed: () async {
                              try {
                                await FirebaseFirestore.instance
                                    .collection('posts')
                                    .doc(widget.postDocument
                                        .id) // ระบุเอกสารที่ต้องการลบ
                                    .delete();
                                Navigator.pop(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ManagePost()),
                                );
                              } catch (e) {
                                print("เกิดข้อผิดพลาดในการลบข้อมูล: $e");
                              }
                            },
                            child: Text("ยืนยัน"),
                          ),
                        ],
                      );
                    },
                  );
                },
                label: Text("ลบโพสต์"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                ),
              ),
            ),
          ),
        ]));
  }
}
