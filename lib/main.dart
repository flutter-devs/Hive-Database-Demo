import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:hiveexample/homepage.dart';


void main() async {

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
      ),
    );
  }


}


