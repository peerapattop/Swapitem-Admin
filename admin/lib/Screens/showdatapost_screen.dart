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
  late String? date;
  late String idposts;
  late String nameobj;
  late String detailpost;
  late String swapwith;
  late String detailoffer;

  @override
  void initState() {
    super.initState();
    idposts = widget.postDocument.id;
    nameobj = widget.postDocument['nameobj'];
    username = widget.postDocument['username'];
    detailpost = widget.postDocument['detailpost'];
    swapwith = widget.postDocument['swapwith'];
    detailoffer = widget.postDocument['detailoffer'];
    // email = widget.userDocument['email'];
    // fname = widget.userDocument['fname'];
    // lname = widget.userDocument['lname'];
    // gender = widget.userDocument['gender'];
    date = widget.postDocument['time']?.toDate().toString();
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
            child: Text(
              "รูปภาพ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "หมายเลขโพสต์ : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: idposts,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "วัน เวลาที่โพสต์ : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: date,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "ชื่อผู้ใช้ : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: username,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "ชื่อสิ่งของ : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: nameobj ,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "รายละเอียด : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: detailpost ,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "ต้องการแลกเปลี่ยนกับ : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: swapwith ,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "รายละเอียด : ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                TextSpan(
                  text: detailoffer ,
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
