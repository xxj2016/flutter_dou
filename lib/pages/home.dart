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
          // decoration: BoxDecoration(color: Colors.pinkAccent),
          child: TopTab(),
        ),
      ),
      Positioned(
        bottom: 0,
        width: 0.70 * screenWidth,
        height: 251 * rpx, // 150px
        child: Container(
          // decoration: BoxDecoration(color: Colors.redAccent),
          child: BtnContent(),
        ),
      ),
      Positioned(
        top: 0.32 * screenHeight,
        right: 0,
        width: 0.25 * screenWidth,
        height: 0.45 * screenHeight,
        child: Container(
          // decoration: BoxDecoration(color: Colors.white),
          child: _getButtonList(rpx),
        ),
      ),
      Positioned(
        bottom: 5,
        right: 10,
        width: 0.2 * screenWidth,
        height: 0.2 * screenWidth,
        child: Container(
          // decoration: BoxDecoration(color: Colors.purpleAccent),
          child: RotateAlbum(),
        ),
      )
    ]);
  }
}

_getButtonList(double rpx) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: <Widget>[
      Container(
          width: 108 * rpx,
          height: 126 * rpx,
          child: Stack(
            children: <Widget>[
              Container(
                width: 108 * rpx,
                height: 126 * rpx,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://p1.music.126.net/sN3DmCp_EU0Zx14P40cR-w==/2765271743870112.jpg?param=180y180'),
                ),
              ),
              Positioned(
                bottom: 00,
                left: 17.5,
                child: Container(
                  width: 45 * rpx,
                  height: 45 * rpx,
                  child: Icon(
                    Icons.add,
                    size: 36 * rpx,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(45 * rpx)),
                ),
              )
            ],
          )),
      IconText(
        txt: '999w',
        icon: Icon(
          Icons.favorite,
          size: 90 * rpx,
          color: Colors.white,
        ),
      ),
      IconText(
        txt: '999w',
        icon: Icon(
          Icons.comment,
          size: 90 * rpx,
          color: Colors.white,
        ),
      ),
      IconText(
        txt: '999w',
        icon: Icon(
          Icons.share,
          size: 90 * rpx,
          color: Colors.white,
        ),
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
          Text(txt,
              style: TextStyle(
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
