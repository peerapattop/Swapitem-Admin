import 'package:admin/Screens/appbar.dart';
import 'package:admin/Screens/Showdata_screens/showdatauser_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ManageUser(),
    );
  }
}

class ManageUser extends StatefulWidget {
  const ManageUser({super.key});
  @override
  State<ManageUser> createState() => _ManageUserState();
}

class _ManageUserState extends State<ManageUser> {
  String? _searchString;
  TextEditingController searchController = TextEditingController();

  final _userRef = FirebaseDatabase.instance.ref().child('users');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppbar('จัดการข้อมูลผู้ใช้'),
        body: StreamBuilder(
          stream: _userRef.onValue,
          builder: (context, snapshot) {
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
                            searchController.clear();
                            _searchString = '';
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: dataMap.length,
                    itemBuilder: (context, index) {
                      dynamic userData = dataMap.values.elementAt(index);
                      String userid = userData['id'].toString();
                      String username = userData['username'].toString();
                      String email = userData['email'].toString();

                      if (_searchString != null &&
                          (_searchString!.isNotEmpty &&
                              (!username
                                      .toLowerCase()
                                      .contains(_searchString!) &&
                                  !email
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
                              // Navigate to the show data user screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowDataUser(userData),
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
