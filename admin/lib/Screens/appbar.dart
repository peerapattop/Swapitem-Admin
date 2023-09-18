import 'package:flutter/material.dart';

PreferredSizeWidget MyAppbar(String name) {
  return AppBar(
    title: Text('$name'),
    toolbarHeight: 40,
    centerTitle: true,
    flexibleSpace: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/appbar.png'),
          fit: BoxFit.fill,
        ),
      ),
    ),
  );
}