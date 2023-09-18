import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/showdatapost_screen.dart';
import 'package:admin/Screens/viewpost_screen.dart';
import 'package:flutter/material.dart';
import '../ScreensForHome/home_screen.dart';
import '../ScreensForHome/notice_screen.dart';
import '../ScreensForHome/setting_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
}

class ManagePost extends StatefulWidget {
  const ManagePost({super.key});

  @override
  State<ManagePost> createState() => _ManagePostState();
}

class _ManagePostState extends State<ManagePost> {
  
  int myIndex = 0;
  String?_searchString ;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       appBar: MyAppbar("จัดการโพสต์"),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("ไม่มีข้อมูล"),
              );
            }
    
            return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        _searchString = val.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide(width: 0.8),
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
                          });
                        },
                      ),
                    ),
                  ),
                ),
                //แสดงข้อมูลผู้ใช้
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document = snapshot.data!.docs[index];
                      String documentId = document['idpost']; // ดึง ID ของเอกสาร
                      String username =
                          document['username']; // ดึงค่า 'username' จากเอกสาร
                      Timestamp time = document['time'];
                      if (_searchString != null &&
                          (_searchString!.isNotEmpty &&
                              (!username.toLowerCase().contains(_searchString!) ))) {
                        return Container(); // ไม่แสดงรายการนี้
                      }
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.all(5),
                        child: ListTile(
                          title: Text(username),
                          subtitle: Text(DateFormat('yyyy-MM-dd HH:mm:ss a').format(time.toDate().toLocal())),
                          leading: CircleAvatar(
                            child: FittedBox(
                              child: Text(documentId),
                            ),
                          ),
                          trailing: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowDataPost(document),
                                ),
                              );
                            },
                            child: Image.asset(
                              "assets/icons/search.png",
                              width: 18,
                              height: 18,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 46, 246, 32),
                              fixedSize: Size(35, 20),
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
