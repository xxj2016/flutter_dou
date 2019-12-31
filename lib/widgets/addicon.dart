import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {
  const AddIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double rpx = screenWidth / 750;
    return Container(
      height: 63 * rpx,
      width: 99 * rpx,
      child: Stack(
        children: <Widget>[
          Positioned(
            height: 63 * rpx,
            width: 90 * rpx,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.cyan, borderRadius: BorderRadius.circular(18 * rpx)),
            ),
          ),
          Positioned(
            height: 63 * rpx,
            width: 90 * rpx,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(18 * rpx)),
            ),
          ),
          Positioned(
            height: 63 * rpx,
            width: 90 * rpx,
            left: 4.5 * rpx,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(18 * rpx)),
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
