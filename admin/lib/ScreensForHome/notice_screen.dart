import 'package:admin/Screens/Manage_Screens/vipData.dart';
import 'package:admin/Screens/Showdata_screens/showdataviprequest_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late String paymentNumber;
  late String date;
  late String email;
  late String firstname;
  late String lastname;
  late String image_payment;
  late String status;
  late String time;
  late String id;
  late String username;
  late String packed;
  final requestvip = FirebaseDatabase.instance.ref().child('requestvip');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
            stream: requestvip.onValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      Text('กำลังโหลด...')
                    ],
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
              return ListView.builder(
                itemCount: dataMap.length,
                itemBuilder: (context, index) {
                  dynamic userData = dataMap.values.elementAt(index);
                  String userid = userData['id'].toString();
                  String username = userData['username'].toString();
                  String email = userData['email'].toString();
                  String firstname = userData['firstname'].toString();
                  String lastname = userData['lastname'].toString();
                  String paymentNumber = userData['paymentNumber'].toString();
                  String packed = userData['packed'].toString();
                  String status = userData['status'].toString();
                  String image_payment = userData['image_payment'].toString();
                  String date = userData['date'].toString();
                  String time = userData['time'].toString();
                  String vipuid = userData['vipuid'].toString();
                  String user_uid = userData['user_uid'].toString();

                  return Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/128/13105/13105632.png'),
                            ),
                            SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 4),
                                  child: Text(firstname + ' ' + lastname),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('ผู้สมัคร VIP ใหม่'),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: ElevatedButton(                               
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ViewVip(
                                          vipData: VipData(
                                            user_uid:user_uid,
                                        PaymentNumber: paymentNumber,
                                        id: userid,
                                        username: username,
                                        email: email,
                                        firstname: firstname,
                                        lastname: lastname,
                                        packed: packed,
                                        status: status,
                                        image_payment: image_payment,
                                        date: date,
                                        time: time,     
                                        vipuid: vipuid,                                   
                                      )),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  "รายละเอียด",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
