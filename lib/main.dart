import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dou',
      home: Scaffold(
        body: Container(decoration: BoxDecoration(color: Colors.yellowAccent),child: Home(),),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 100,
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Positioned(
          top:0,
          height: 100,
          width: screenWidth,
          child: Container(decoration: BoxDecoration(color: Colors.pinkAccent),),
        ),
        Positioned(
          bottom: 0,
          width: 0.70 * screenWidth,
          height: 150,
          child: Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
        ),
        Positioned(
          top: 0.4 * screenHeight,
          right: 0,
          width: 0.25 * screenWidth,
          height: 0.3 * screenHeight,
          child: Container(decoration: BoxDecoration(color: Colors.white),),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          width: 0.25 * screenWidth,
          height: 0.25 * screenWidth,
          child: Container(decoration: BoxDecoration(color: Colors.purpleAccent),),
        )
      ]
    );
  }
}