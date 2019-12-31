import 'package:flutter/material.dart';
import 'package:flutter_dou/widgets/buttoncontent.dart';
import 'package:flutter_dou/widgets/rotatealbum.dart';
import 'package:flutter_dou/widgets/toptab.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double rpx = screenWidth / 750;
    return Stack(children: [
      Positioned(
        top: 0,
        height: 217 * rpx, // 120px
        width: screenWidth,
        child: Container(
          decoration: BoxDecoration(color: Colors.pinkAccent),
          child: TopTab(),
        ),
      ),
      Positioned(
        bottom: 0,
        width: 0.70 * screenWidth,
        height: 271 * rpx, // 150px
        child: Container(
          decoration: BoxDecoration(color: Colors.redAccent),
          child: BtnContent(),
        ),
      ),
      Positioned(
        top: 0.32 * screenHeight,
        right: 0,
        width: 0.25 * screenWidth,
        height: 0.4 * screenHeight,
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: _getButtonList(),
        ),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        width: 0.25 * screenWidth,
        height: 0.25 * screenWidth,
        child: Container(
          decoration: BoxDecoration(color: Colors.purpleAccent),
          child: RotateAlbum(),
        ),
      )
    ]);
  }
}

_getButtonList() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Container(
        width: 60,
        height: 70,
          child: Stack(
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'http://p1.music.126.net/sN3DmCp_EU0Zx14P40cR-w==/2765271743870112.jpg?param=180y180'),
            ),
          ),
          Positioned(
            bottom: 00,
            left: 17.5,
            child: Container(
              width: 25,
              height: 25,
              child: Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
              decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(25)),
            ),
          )
        ],
      )),
      IconText(
        txt: '999w',
        icon: Icon(Icons.favorite, size: 50, color:  Colors.white,),
      ),
      IconText(
        txt: '999w',
        icon: Icon(Icons.feedback, size: 50, color:  Colors.white,),
      ),
      IconText(
        txt: '999w',
        icon: Icon(Icons.replay, size: 50, color:  Colors.white,),
      ),
    ],
  );
}

class IconText extends StatelessWidget {
  const IconText({Key key, this.icon, this.txt}) : super(key: key);
  final Icon icon;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          Text(txt,style:  TextStyle(color:  Colors.white,)),
        ],
      ),
    );
  }
}
