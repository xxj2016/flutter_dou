import 'package:flutter/material.dart';
import 'package:flutter_dou/pages/sameCity/SameCityPage.dart';
import 'package:flutter_dou/widgets/addicon.dart';
import 'package:flutter_dou/main.dart';
import 'package:provider/provider.dart';

class BtmBar extends StatefulWidget {
  BtmBar({Key key, this.selectIndex}) : super(key: key);
  final int selectIndex;
  @override
  _BtmBarState createState() => _BtmBarState();
}

class _BtmBarState extends State<BtmBar> {
  List<bool> selected = List<bool>();
  List<String> selectItems = List<String>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 4; i++) {
      selected.add(false);
    }
    selected[widget.selectIndex] = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  tapItem(index) {
    switch (index) {
      case 0:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => RecommendPage(
                      selIndex: index,
                    )),
            ModalRoute.withName("/Home"));
        break;
      case 1:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => SameCityMain(selIndex: index),
            )
            // builder: (context) => MultiProvider(
            //   providers: [
            //     ChangeNotifierProvider(
            //       create: (context) => PostsGalleryProvider(),
            //     )
            //   ],
            //   child: SameCityMain(
            //     selIndex: index
            //   ),
            // )
            ,
            ModalRoute.withName("/sameCity"));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    double rpx = MediaQuery.of(context).size.width / 750;

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: _getBtmTextWidget("首页", selected[0], () {
              tapItem(0);
            }, rpx),
          ),
          Expanded(
            flex: 1,
            child: _getBtmTextWidget("同城", selected[1], () {
              tapItem(1);
            }, rpx),
          ),
          Expanded(flex: 1, child: AddIcon(tapItem: () {tapItem(3); }),),
          Expanded(
            flex: 1,
            child: _getBtmTextWidget("消息", selected[2], () {
              tapItem(2);
            }, rpx),
          ),
          Expanded(
            flex: 1,
            child: _getBtmTextWidget("我", selected[3], () {
              tapItem(3);
            }, rpx),
          ),
        ],
      ),
    );
  }
}

// class BtmBar extends StatelessWidget {
//   const BtmBar({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           _getBtmTextWidget('首页', true),
//           _getBtmTextWidget('同城', false),
//           AddIcon(),
//           _getBtmTextWidget('消息', false),
//           _getBtmTextWidget('我', false),
//         ],
//       ),
//     );
//   }
// }

_getBtmTextWidget(String content, bool ifSelected, tapFunc, double rpx) {
  return FlatButton(
    onPressed: () {
      tapFunc();
    },
    child: Text(
      "$content",
      style: ifSelected
      ? TextStyle(
        fontSize: 30 * rpx,
        color: Colors.white,
        fontWeight: FontWeight.w900
      )
      : TextStyle(
        fontSize: 30 * rpx,
        color: Colors.grey[600],
        fontWeight: FontWeight.w900
      ),
    ),
  );
}
