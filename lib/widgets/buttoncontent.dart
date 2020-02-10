import 'package:flutter/material.dart';
import 'package:flutter_dou/providers/RecommendProvider.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:provider/provider.dart';
class BtnContent extends StatelessWidget {
  const BtnContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RecommendProvider provider = Provider.of<RecommendProvider>(context, listen: false);
    MainInfo mainInfo = provider.mainInfo;
    double screenWidth = MediaQuery.of(context).size.width;
    double rpx = screenWidth / 750;
    return Container(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text('@${mainInfo.userName}', style: TextStyle(color: Colors.white),),
          subtitle: Text(
            "${mainInfo.content}",
            style: TextStyle(color: Colors.white),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 18 * rpx,),
            Icon(Icons.music_note, color: Colors.white,),
            // MarqueeWidget(
            //   text: 'Some sample text that takes some space.',
            //   textStyle: TextStyle(fontSize: 28 * rpx, fontWeight: FontWeight.bold),
            // )
            // // Marquee(
            // //   text: '士校机塞外际阵十研数子音强脱。编封定吗！',
            // //   style: TextStyle(fontWeight: FontWeight.bold),
            // //   scrollAxis: Axis.horizontal,
            // // )
            Text('士校机塞外际阵十研数子', style: TextStyle(color: Colors.white),),
          ],
        )
      ],
    ));
  }
}
