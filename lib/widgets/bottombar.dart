import 'package:flutter/material.dart';
import 'package:flutter_dou/widgets/addicon.dart';

class BtmBar extends StatelessWidget {
  const BtmBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _getBtmTextWidget('首页', true),
          _getBtmTextWidget('同城', false),
          AddIcon(),
          _getBtmTextWidget('消息', false),
          _getBtmTextWidget('我', false),
        ],
      ),
    );
  }
}

_getBtmTextWidget(String content, bool ifSelected) {
  return Text(
    "$content",
    style: ifSelected
        ? TextStyle(fontSize: 18.0, color: Colors.white)
        : TextStyle(fontSize: 18.0, color: Colors.grey[600]),
  );
}
