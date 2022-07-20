// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:main/pages/checkout.dart';
import 'package:main/pages/homepage.dart';
import 'package:main/pages/productdisplay.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/ProductDisplay' : (context) => ProductDisplay(),
      },
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
