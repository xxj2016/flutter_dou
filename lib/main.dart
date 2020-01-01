import 'package:flutter/material.dart';
import 'package:flutter_dou/pages/home.dart';
import 'package:flutter_dou/widgets/bottombar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dou',
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.grey[500]),
          child: Home(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 60,
            decoration: BoxDecoration(color: Colors.black),
            child: BtmBar(),
          ),
        ),
      ),
    );
  }
}

