import 'package:admin/Screens/Manage_Screens/postData.dart';
import 'package:admin/Screens/appbar.dart';
import 'package:flutter/material.dart';

class ShowDataPost extends StatefulWidget {
  final PostData postData;

  const ShowDataPost({required this.postData});

  @override
  State<ShowDataPost> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ShowDataPost> {
  late String username;
  late String postNumber;
  late String brand;
  late String date;
  late String detail;
  late String details1;
  late String imageUrls;
  late String item_name;
  late String item_name1;
  late String model;
  late String model1;
  late String type;
  late String time;
  late String formattedDatetime = ''; // Initialize formattedDatetime
  // List<String> foodList = [
  //   "https://cdn.pixabay.com/photo/2010/12/13/10/05/berries-2277_1280.jpg",
  //   "https://cdn.pixabay.com/photo/2015/12/09/17/11/vegetables-1085063_640.jpg",
  //   "https://cdn.pixabay.com/photo/2017/01/20/15/06/oranges-1995056_640.jpg",
  //   "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_640.jpg",
  //   "https://cdn.pixabay.com/photo/2016/07/22/09/59/fruits-1534494_640.jpg",
  // ];
  int mySlideindex = 0;
  int selectedButton = 0;

  @override
  void initState() {
    super.initState();
    postNumber = widget.postData.postNumber;
    brand = widget.postData.brand;
    username = widget.postData.username;
    date = widget.postData.date;
    detail = widget.postData.detail;
    details1 = widget.postData.details1;
    imageUrls = widget.postData.imageUrls;
    item_name = widget.postData.item_name;
    item_name1 = widget.postData.item_name1;
    model = widget.postData.model;
    model1 = widget.postData.model1;
    type = widget.postData.type;
    time = widget.postData.time;
  }

  Widget showDataPosts(String label, String data, Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        readOnly: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          labelText: '$label',
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          hintStyle: TextStyle(
            fontStyle: FontStyle.italic,
          ),
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: icon,
        ),
        controller: TextEditingController(text: data),
        maxLines: null, // Allow multiple lines
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: myAppbar("แสดงข้อมูลโพสต์"),
            body: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                      child: SizedBox(
                        height: 300,
                        child: PageView.builder(
                          onPageChanged: (value) {
                            setState(() {
                              mySlideindex = value;
                            });
                          },
                          itemCount: imageUrls.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    imageUrls[index],
                                    fit: BoxFit.cover,
                                  )),
                            );
                          },
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 60,
                        width: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageUrls.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: index == mySlideindex
                                      ? Colors.deepPurple
                                      : Colors.grey,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.tag, // เปลี่ยนเป็นไอคอนที่คุณต้องการ
                                color:
                                    Colors.blue, // เปลี่ยนสีไอคอนตามความต้องการ
                              ),
                              SizedBox(
                                  width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                              Text(
                                "หมายเลขการโพสต์ : $postNumber ",
                                style: MyTextStyle(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.person, // เปลี่ยนเป็นไอคอนที่คุณต้องการ
                                color:
                                    Colors.blue, // เปลี่ยนสีไอคอนตามความต้องการ
                              ),
                              SizedBox(
                                  width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                              Text(
                                "ชื่อผู้โพสต์ : $username ",
                                style: MyTextStyle(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons
                                    .date_range, // เปลี่ยนเป็นไอคอนที่คุณต้องการ
                                color:
                                    Colors.blue, // เปลี่ยนสีไอคอนตามความต้องการ
                              ),
                              SizedBox(
                                  width: 8), // ระยะห่างระหว่างไอคอนและข้อความ
                              Text(
                                "วันที่ $date",
                                style: MyTextStyle(),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons
                                    .punch_clock, // เปลี่ยนเป็นไอคอนที่คุณต้องการ
                                color:
                                    Colors.blue, // เปลี่ยนสีไอคอนตามความต้องการ
                              ),
                              Text(
                                " เวลา $time น.",
                                style: MyTextStyle(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 2, right: 15, top: 10, bottom: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 170, 170, 169),
                                borderRadius: BorderRadius.circular(
                                    12.0), // ทำให้ Container โค้งมน
                              ),
                              padding: EdgeInsets.all(
                                  11), // ระยะห่างของเนื้อหาจาก Container
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "ชื่อสิ่งของ : $item_name",
                                    style: MyTextStyle(),
                                  ),
                                  Text(
                                    "หมวดหมู่ : $type",
                                    style: MyTextStyle(),
                                  ),
                                  Text(
                                    "ยี่ห้อ : $brand",
                                    style: MyTextStyle(),
                                  ),
                                  Text(
                                    "รุ่น : $model",
                                    style: MyTextStyle(),
                                  ),
                                  Text(
                                    'รายละเอียด : $detail',
                                    style: MyTextStyle(),
                                  ),
                                  Divider(),
                                  Text(
                                    "ต้องการแลกเปลี่ยนกับ : $item_name1",
                                    style: MyTextStyle(),
                                  ),
                                  Text(
                                    'รายละเอียด : $details1',
                                    style: MyTextStyle(),
                                  ),
                                  Text(
                                    "สถานที่ : ",
                                    style: MyTextStyle(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
            )));
  }
}

MyTextStyle() {
  return TextStyle(
    fontSize: 20,
    color: Colors.black,
  );
}
