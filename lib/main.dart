import 'package:flutter/material.dart';
import 'package:flutter_dou/pages/home.dart';
import 'package:flutter_dou/providers/RecommendProvider.dart';
import 'package:flutter_dou/widgets/bottombar.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dou',
      theme: ThemeData(primaryColor: Color(0xff121319)),
      home: RecommendPage(),
    );
  }
}

class RecommendPage extends StatelessWidget {
  const RecommendPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // RecommendProvider provider = Provider.of<RecommendProvider>(context);
    // MainInfo mainInfo = provider.mainInfo;
    // var videoPath = mainInfo.videoPath;
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
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.black),
              child: BtmBar(),
            ),
          ),
        ));
  }
}

class MainTabView extends StatelessWidget {
  const MainTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecommendProvider provider = Provider.of<RecommendProvider>(context);
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
