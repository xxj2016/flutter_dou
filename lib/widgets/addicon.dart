import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({Key key, @required this.tapItem}) : super(key: key);
  final VoidCallback tapItem;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double rpx = screenWidth / 750;
    double iconHeight = 55 * rpx;
    double totalWidth = 90 * rpx;
    double eachSide = 5 * rpx;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30 * rpx),
      height: iconHeight,
      width: 150 * rpx,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          tapItem();
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              height: iconHeight,
              width: totalWidth - eachSide,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.cyan,
                    borderRadius: BorderRadius.circular(18 * rpx)),
              ),
            ),
            Positioned(
              height: iconHeight,
              width: totalWidth - eachSide,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(18 * rpx)),
              ),
            ),
            Positioned(
              height: iconHeight,
              width: totalWidth - eachSide,
              right: eachSide,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18 * rpx)),
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
