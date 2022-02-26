import 'package:flutter/material.dart';
import 'package:restaurant/component/detail.dart';
import 'package:restaurant/dashboard.dart';
import 'package:restaurant/theme/Style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'mont'),
      home: MyHomePage(),
    );
  }
}


