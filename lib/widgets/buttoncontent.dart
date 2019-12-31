import 'package:flutter/material.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
class BtnContent extends StatelessWidget {
  const BtnContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double rpx = screenWidth / 750;
    return Container(
        child: Column(
      children: <Widget>[
        ListTile(
          title: Text('@人民日报'),
          subtitle: Text("败标身脸选姐例出标登？双忙担秘队句中如。修古打专怀成承岁？调河城集底推出制天惊。"),
        ),
        Row(
          children: <Widget>[
            Icon(Icons.music_note),
            // MarqueeWidget(
            //   text: 'Some sample text that takes some space.',
            //   textStyle: TextStyle(fontSize: 28 * rpx, fontWeight: FontWeight.bold),
            // )
            // // Marquee(
            // //   text: '士校机塞外际阵十研数子音强脱。编封定吗！',
            // //   style: TextStyle(fontWeight: FontWeight.bold),
            // //   scrollAxis: Axis.horizontal,
            // // )
            Text('士校机塞外际阵十研数子'),
          ],
        )
      ],
    ));
  }
}
