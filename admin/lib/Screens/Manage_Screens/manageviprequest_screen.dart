import 'package:admin/Screens/Showdata_screens/showdataviprequest_screen.dart';
import 'package:admin/Screens/appbar.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class VipRequest extends StatefulWidget {
  const VipRequest({super.key});

  @override
  State<VipRequest> createState() => _VipRequestState();
}

class _VipRequestState extends State<VipRequest> {
 TextEditingController searchController = TextEditingController();
  String? _searchString;
  final _vipRef = FirebaseDatabase.instance.ref().child('requestvip');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppbar('คำขอสมัคร VIP'),
        body: StreamBuilder(
          stream:
              _vipRef.onValue,
          builder: (context,  snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [CircularProgressIndicator(), Text('กำลังโหลด..')],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data == null) {
              return const Center(
                child: Text("ไม่มีข้อมูล"),
              );
            }
            DataSnapshot dataSnapshot = snapshot.data!.snapshot;
            Map<dynamic, dynamic>? dataMap = dataSnapshot.value as Map?;

             if (dataMap == null || dataMap.isEmpty) {
              return const Center(
                child: Text("ไม่มีข้อมูล"),
              );
            }
    
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: searchController,
                    onChanged: (val) {
                      setState(() {
                        _searchString = val.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: const BorderSide(width: 0.8),
                      ),
                      hintText: "ค้นหา",
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.clear,
                        ),
                        onPressed: () {
                          setState(() {
                            _searchString = '';
                            searchController.clear();
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //แสดงข้อมูลผู้ใช้
                Expanded(
                  child: ListView.builder(
                    itemCount: dataMap.length,
                    itemBuilder: (context, index) {
                      dynamic userData = dataMap.values.elementAt(index);
                      String userid = userData['id']; // ดึง ID ของเอกสาร
                      String username =
                          userData['username']; // ดึงค่า 'username' จากเอกสาร
                      String email = userData['packed'];
                      if (_searchString != null &&
                          (_searchString!.isNotEmpty &&
                              (!username
                                  .toLowerCase()
                                  .contains(_searchString!)))) {
                        return Container(); 
                      }
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(username),
                          subtitle: Text(email),
                          leading: CircleAvatar(
                            child: FittedBox(
                              child: Text(userid),
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewVip(userData),
                                ),
                              );
                            },
                            child: Image.asset(
                              "assets/icons/search.png",
                              width: 18,
                              height: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color.fromARGB(255, 46, 246, 32),
                              fixedSize: const Size(35, 20),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
