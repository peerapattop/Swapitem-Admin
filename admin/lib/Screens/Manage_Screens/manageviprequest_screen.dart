import 'dart:ffi';

import 'package:admin/Screens/Manage_Screens/VipData.dart';
import 'package:admin/Screens/Showdata_screens/showdataviprequest_screen.dart';
import 'package:admin/Screens/appbar.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';


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
                      dynamic vipData = dataMap.values.elementAt(index);
                      String paymentNumber = vipData['PaymentNumber'];
                      String date = vipData['date'];
                      String email = vipData['email'];
                      String firstname = vipData['firstname'];
                      String image_payment = vipData['image_payment'];
                      String lastname = vipData['lastname'];
                      String status = vipData['status'];
                      String time = vipData['time'];          
                      String userid = vipData['id']; 
                      String packed = vipData['packed'];
                      String username =
                          vipData['username']; // ดึงค่า 'username' จากเอกสาร
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
                                  builder: (context) => ViewVip(
                                     vipData: VipData(
                                      packed: packed,
                                      PaymentNumber: paymentNumber, 
                                      date: date, 
                                      email: email, 
                                      firstname: firstname, 
                                      lastname: lastname, 
                                      image_payment: image_payment, 
                                      status: status, 
                                      time: time, 
                                      id: userid, 
                                      username: username),
                                  ),
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
                              //
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
