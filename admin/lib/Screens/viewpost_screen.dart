import 'package:flutter/material.dart';

void main() {
  runApp(ViewPost());
}

class ViewPost extends StatefulWidget {
  const ViewPost({super.key});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("จัดการโพสต์"),
        centerTitle: true,
      ),
    );
  }
}