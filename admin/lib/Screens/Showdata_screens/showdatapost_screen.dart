import 'package:admin/Screens/Manage_Screens/postData.dart';
import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/Manage_Screens/managepost_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ShowDataPost extends StatefulWidget {
  final PostData postData;

  const ShowDataPost({required this.postData});

  @override
  State<ShowDataPost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShowDataPost> {
  late String username;
  late String postNumber;
  late String brand;
  late String date;
  late String detail;
  late String details1;
  late String imageUrls;
  late String item_name;
  late String item_name1;
  late String model;
  late String model1;
  late String type;
  late String formattedDatetime = ''; // Initialize formattedDatetime

  @override
  void initState() {
    super.initState();
    postNumber = widget.postData.postNumber;
    brand = widget.postData.brand;
    username = widget.postData.username;
    date = widget.postData.date;
    detail = widget.postData.detail;
    details1 = widget.postData.details1;
    imageUrls = widget.postData.imageUrls;
    item_name = widget.postData.item_name;
    item_name1 = widget.postData.item_name1;
    model = widget.postData.model;
    model1 = widget.postData.model1;
    type = widget.postData.type;

  }

  Widget showDataPosts(String label, String data,Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: '$label',
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: icon,
        ),
        controller: TextEditingController(text: data),
        maxLines: null, // Allow multiple lines
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppbar("แสดงข้อมูลโพสต์"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  child: Center(child: Image.asset('assets/images/shoestest.jpg',width: 250,)),
                ),
              ),
              showDataPosts("หมายเลขโพสต์", postNumber,Icon(Icons.numbers)),
              showDataPosts(
                  "วัน เวลาที่โพสต์", formattedDatetime,Icon(Icons.date_range)), // Use formattedDatetime
              showDataPosts("ชื่อผู้โพสต์", username,Icon(Icons.person)),
              showDataPosts("ชื่อสิ่งของ", item_name,Icon(Icons.abc)),
              showDataPosts("รายละเอียด", detail,Icon(Icons.apps_sharp)),
              Center(child: Image.asset("assets/images/swap.png")),
              showDataPosts("ชื่อสิ่งของ", item_name1,Icon(Icons.abc)),
              showDataPosts("รายละเอียด", details1,Icon(Icons.apps_sharp)),
              // showDataPosts("สถานที่แลกเปลี่ยน", location,Icon(Icons.location_on)),
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
                                  // try {
                                  //   await FirebaseFirestore.instance
                                  //       .collection('posts')
                                  //       .doc(widget.postData
                                  //           .id) // Specify the document to delete
                                  //       .delete();
                                  //   Navigator.pop(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => ManagePost()),
                                  //   );
                                  // } catch (e) {
                                  //   print("เกิดข้อผิดพลาดในการลบข้อมูล: $e");
                                  // }
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
            ],
          ),
        ),
      ),
    );
  }
}
