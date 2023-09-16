import 'package:admin/Screens/viewvip_screen.dart';
import 'package:admin/Screens/viprequest_screen.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child:  SizedBox(
                    width: 600,
                    height: 170,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "แจ้งเตือน",
                                style: TextStyle(fontSize: 20),
                              ),
                              Spacer(),
                              Padding(
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  "วันที่ 20/5/2566",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "คุณมีการสมัคร VIP เข้ามาใหม่",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    "ชื่อผู้ใช้ : พีรพัฒน์",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(height: 15,),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                 VipRequest()),
                                      );
                                    },
                                    child: Text('ตรวจสอบ',style: TextStyle(fontSize: 18),),
                                    style: ElevatedButton.styleFrom(
                                      primary:
                                          Colors.orange, 
                                      onPrimary:
                                          Colors.white, 
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
