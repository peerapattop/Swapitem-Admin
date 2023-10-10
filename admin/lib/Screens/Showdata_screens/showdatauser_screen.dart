import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/Manage_Screens/manageuser_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class ShowDataUser extends StatefulWidget {
  final DocumentSnapshot userDocument;

  ShowDataUser(this.userDocument);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<ShowDataUser> {
  late String? username;
  late String email;
  late String fname;
  late String lname;
  late String gender;
  late String userid;
  late String profile;
  DateTime date = DateTime.now();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    username = widget.userDocument['username'];
    email = widget.userDocument['email'];
    fname = widget.userDocument['fname'];
    lname = widget.userDocument['lname'];
    gender = widget.userDocument['gender'];
    userid = widget.userDocument['userid'];   
    Timestamp timestamp = widget.userDocument['date'];
    date = timestamp.toDate();
    dateController.text = DateFormat('yyyy-MM-dd').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppbar('รายละเอียดผู้ใช้'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                    child: Image.asset(
                  'assets/images/LogoSwapItem.png',
                  width: 100,
                )),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                    readOnly: true,
                    controller: TextEditingController(text: userid.toString()),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'หมายเลขผู้ใช้',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.numbers),

                    ),
                    onChanged: (value) {
                      setState(() {
                        userid = value;
                      });
                      
                    },
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: fname),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'ชื่อ',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      alignLabelWithHint: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        fname = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: lname),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'นามสกุล',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      alignLabelWithHint: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        lname = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'เพศ',
                            style: TextStyle(fontSize: 22),
                          ),
                          SizedBox(width: 15,),
                          Radio(
                            activeColor: Colors.green,
                            value: "ชาย",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          Text("ชาย", style: TextStyle(fontSize: 18)),
                          SizedBox(
                              width:
                                  20), // Add some space between Radio and Text
                          Radio(
                            activeColor: Colors.green,
                            value: "หญิง",
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value.toString();
                              });
                            },
                          ),
                          Text("หญิง", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: username),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'ชื่อผู้ใช้',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                    ),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: email),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'อีเมล',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                      
                    },
                    
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'วันเกิด',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.date_range),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.save),
                      onPressed: () async {
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.userDocument.id)
                            .update({
                          'username': username,
                          'email': email,
                          'fname': fname,
                          'lname': lname,
                          'gender': gender,
                          'date': date,
                        });
                        Navigator.pop(
                          context,
                          MaterialPageRoute(builder: (context) => ManageUser()),
                        );
                      },
                      label: Text("บันทึกการแก้ไข"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton.icon(
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
                                          .collection('users')
                                          .doc(widget.userDocument.id)
                                          .delete();
                                      Navigator.pop(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ManageUser()),
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
                      label: Text("ลบข้อมูล"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        onPrimary: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date, // ให้เริ่มต้นด้วยค่า date ที่มีอยู่
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(date);
      });
    }
  }
}
