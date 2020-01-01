import 'package:flutter/material.dart';

class TopTab extends StatefulWidget {
  TopTab({Key key}) : super(key: key);

  @override
  _TopTabState createState() => _TopTabState();
}

class _TopTabState extends State<TopTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: 2, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double rpx = screenWidth / 750;
    double iconSize = 54 * rpx;
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Expanded(
        child: Icon(
          Icons.search,
          size: iconSize,
          color: Colors.white,
        ),
        flex: 2,
      ),
      Expanded(
        flex: 8,
        child: Container(
          width: 434 * rpx, // 240,
          padding: EdgeInsets.symmetric(horizontal: 100 * rpx), // 70px
          child: TabBar(
            indicatorColor: Colors.white,
            labelStyle:
                TextStyle(color: Colors.white, fontSize: 45 * rpx), // 25px
            unselectedLabelStyle:
                TextStyle(color: Colors.grey[700], fontSize: 36 * rpx), // 20px
            controller: _controller,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 55),
            tabs: <Widget>[
              Text('关注'),
              Text('推荐'),
            ],
          ),
        ),
      ),
      Flexible(
          flex: 2,
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 30 * rpx,
              ), // 20px
              Icon(
                Icons.live_tv,
                size: iconSize,
                color: Colors.white,
              ),
            ],
          ))
    ]);
  }
}
