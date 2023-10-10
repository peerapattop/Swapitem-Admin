import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/Manage_Screens/managepost_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ShowDataPost extends StatefulWidget {
  final DocumentSnapshot postDocument;

  ShowDataPost(this.postDocument);

  @override
  State<ShowDataPost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShowDataPost> {
  late String username;
  late String idposts;
  late String nameobj;
  late String detailpost;
  late String swapwith;
  late String detailoffer;
  late String location;
  late String datetime; // Declare datetime at the class level
  late String formattedDatetime = ''; // Initialize formattedDatetime

  @override
  void initState() {
    super.initState();
    idposts = widget.postDocument['idpost'];
    nameobj = widget.postDocument['nameobj'];
    username = widget.postDocument['username'];
    detailpost = widget.postDocument['detailpost'];
    swapwith = widget.postDocument['swapwith'];
    detailoffer = widget.postDocument['detailoffer'];
    location = widget.postDocument['location'];
    Timestamp firestoreTimestamp =
        widget.postDocument['time']; // ดึง timestamp จาก Firestore
    DateTime dateTimeInUtc = firestoreTimestamp.toDate();
    DateTime dateTimeInLocalTimeZone = dateTimeInUtc.toLocal();

    formattedDatetime =
        DateFormat('yyyy-MM-dd HH:mm:ss a').format(dateTimeInLocalTimeZone);
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
        appBar: MyAppbar("แสดงข้อมูลโพสต์"),
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
              showDataPosts("หมายเลขโพสต์", idposts,Icon(Icons.numbers)),
              showDataPosts(
                  "วัน เวลาที่โพสต์", formattedDatetime,Icon(Icons.date_range)), // Use formattedDatetime
              showDataPosts("ชื่อผู้โพสต์", username,Icon(Icons.person)),
              showDataPosts("ชื่อสิ่งของ", nameobj,Icon(Icons.abc)),
              showDataPosts("รายละเอียด", detailpost,Icon(Icons.apps_sharp)),
              Center(child: Image.asset("assets/images/swap.png")),
              showDataPosts("ชื่อสิ่งของ", swapwith,Icon(Icons.abc)),
              showDataPosts("รายละเอียด", detailoffer,Icon(Icons.apps_sharp)),
              showDataPosts("สถานที่แลกเปลี่ยน", location,Icon(Icons.location_on)),
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
                                            .id) // Specify the document to delete
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
            ],
          ),
        ),
      ),
    );
  }
}