import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowDataUser extends StatefulWidget {
  const ShowDataUser({super.key});

  @override
  State<ShowDataUser> createState() => _ShowDataUserState();
}

class _ShowDataUserState extends State<ShowDataUser> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("รายละเอียดผู้ใช้"),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("ไม่มีข้อมูล"),
              );
            }
            //พื้นที่แสดงข้อมูลผู้ใช้งาน
            return Container(
              child: Column(
                children: [
                  TextFormField(
                    
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
