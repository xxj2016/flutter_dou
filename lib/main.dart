import 'package:flutter/material.dart';
import 'package:flutter_dou/pages/home.dart';
import 'package:flutter_dou/providers/RecommendProvider.dart';
import 'package:flutter_dou/widgets/BottomBar.dart';
import 'package:provider/provider.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => RecommendProvider(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dou',
      theme: ThemeData(primaryColor: Color(0xff121319)),
      home: RecommendPage(
        selIndex: 0,
      ),
    );
  }
}

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key key, @required this.selIndex}) : super(key: key);
  final int selIndex;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => RecommendProvider(),
          )
        ],
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: MainTabView(),
          ),
          bottomNavigationBar: BottomSafeBar(
            selIndex: selIndex,
          ),
        ));
  }
}

class BottomSafeBar extends StatelessWidget {
  const BottomSafeBar({Key key, @required this.selIndex}) : super(key: key);
  final int selIndex;
  @override
  Widget build(BuildContext context) {
    // RecommendProvider provider = Provider.of<RecommendProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: SafeArea(
        child: BottomAppBar(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
            height: 60,
            child: BtmBar(
              selectIndex: selIndex,
            ),
          ),
        ),
      ),
    );
  }
}

class MainTabView extends StatelessWidget {
  const MainTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecommendProvider provider = Provider.of<RecommendProvider>(context, listen: true);
    MainInfo mainInfo = provider.mainInfo;
    var videoPath = mainInfo.videoPath;
    return Stack(
      children: <Widget>[
        CenterImage(
          videoPath: videoPath,
        ),
        Home(),
      ],
    );
  }
}

class CenterImage extends StatelessWidget {
  const CenterImage({Key key, @required this.videoPath}) : super(key: key);
  final String videoPath;
  @override
  Widget build(BuildContext context) {
    // double bottom = MediaQuery.of(context).viewInsets.bottom;
    // RecommendProvider provider = Provider.of<RecommendProvider>(context);
    return Center(
      child: Container(
          // padding: EdgeInsets.only(top: bottom),
          child: Image.network(videoPath)),
    );
  }
}
