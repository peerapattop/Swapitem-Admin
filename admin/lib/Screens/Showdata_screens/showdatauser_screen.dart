import 'dart:io';

import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/Manage_Screens/manageuser_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


class ShowDataUser extends StatefulWidget {
  final DocumentSnapshot userDocument;

  ShowDataUser(this.userDocument);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<ShowDataUser> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

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
        appBar: myAppbar('รายละเอียดผู้ใช้'),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                //รูปภาพผู้ใช้
                Center(child: imgProfile()),
                //หมายเลขผู้ใช้
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
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      prefixIcon: const Icon(Icons.numbers),
                    ),
                    onChanged: (value) {
                      setState(() {
                        userid = value;
                      });
                    },
                  ),
                ),
                //ชื่อ
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
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      alignLabelWithHint: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        fname = value;
                      });
                    },
                  ),
                ),
                //นามสกุล
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: lname),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'นามสกุล',
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                      alignLabelWithHint: true,
                    ),
                    onChanged: (value) {
                      setState(() {
                        lname = value;
                      });
                    },
                  ),
                ),
                //เพศ
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          const Text(
                            'เพศ',
                            style: TextStyle(fontSize: 22),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
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
                          const Text("ชาย", style: TextStyle(fontSize: 18)),
                          const SizedBox(
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
                          const Text("หญิง", style: TextStyle(fontSize: 18)),
                        ],
                      ),
                    ],
                  ),
                ),
                //ชื่อผู้ใช้
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: username),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'ชื่อผู้ใช้',
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.person),
                    ),
                    onChanged: (value) {
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: TextEditingController(text: email),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'อีเมล',
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.email),
                    ),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 15, right: 15, bottom: 15),
                  child: TextField(
                    controller: dateController,
                    readOnly: true,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelText: 'วันเกิด',
                      labelStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: const Icon(Icons.date_range),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: const Icon(Icons.save),
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
                      label: const Text("บันทึกการแก้ไข"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    ElevatedButton.icon(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("ยืนยันการลบ"),
                              content: const Text("คุณต้องการลบข้อมูลนี้ใช่หรือไม่?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const  Text("ยกเลิก"),
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
                      label: const Text("ลบข้อมูล"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
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

  void takePhoto(ImageSource source) async {
    final dynamic pickedFile = await ImagePicker().pickImage(
      source: source,
    );

    if (pickedFile != null) {
    setState(() {
      _imageFile = pickedFile;
    });

    // Close the file selection window
    Navigator.pop(context);
  }
  }

  Widget imgProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 60.0,
          backgroundImage: _imageFile != null
        ? FileImage(File(_imageFile!.path))
        : AssetImage('assets/images/profile_defalt.jpg') as ImageProvider<Object>,

        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: ((Builder) => bottomSheet()));
            },
            child: const Icon(
              Icons.camera_alt,
              color: const Color.fromARGB(255, 52, 0, 150),
              size: 28,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "เลือกรูปภาพของคุณ",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: Icon(Icons.camera),
                label: Text('กล้อง'),
              ),
              TextButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: Icon(Icons.camera),
                label: Text('แกลลอรี่'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
