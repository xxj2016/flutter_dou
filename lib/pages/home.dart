import 'package:flutter/material.dart';
import 'package:flutter_dou/pages/RecommendPage/BottomSheet.dart';
import 'package:flutter_dou/providers/RecommendProvider.dart';
import 'package:flutter_dou/widgets/FavAnimation.dart';
import 'package:flutter_dou/widgets/buttoncontent.dart';
import 'package:flutter_dou/widgets/rotatealbum.dart';
import 'package:flutter_dou/widgets/toptab.dart';
import 'package:provider/provider.dart';

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
          child: ButtonList(),
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

class ButtonList extends StatefulWidget {
  ButtonList({Key key}) : super(key: key);

  @override
  _ButtonListState createState() => _ButtonListState();
}

class _ButtonListState extends State<ButtonList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double rpx = screenWidth / 750;
    RecommendProvider provider = Provider.of<RecommendProvider>(context, listen: false);
    MainInfo mainInfo = provider.mainInfo;

    List<IconAnimationStage> stages1 = List<IconAnimationStage>();
    stages1.add(IconAnimationStage(
        color: Colors.grey[100],
        start: 1.0,
        end: 0.0,
        duration: Duration(milliseconds: 200)));
    stages1.add(IconAnimationStage(
        color: Colors.redAccent,
        start: 0.0,
        end: 1.3,
        duration: Duration(milliseconds: 300)));
    stages1.add(IconAnimationStage(
        color: Colors.redAccent,
        start: 1.3,
        end: 1.0,
        duration: Duration(milliseconds: 100)));

    List<IconAnimationStage> stages2 = List<IconAnimationStage>();
    stages2.add(IconAnimationStage(
        color: Colors.grey[100],
        start: 1.0,
        end: 1.2,
        duration: Duration(milliseconds: 200)));
    stages2.add(IconAnimationStage(
        color: Colors.grey[100],
        start: 1.2,
        end: 1.0,
        duration: Duration(milliseconds: 200)));

    List<IconAnimationStage> stages3 = List<IconAnimationStage>();
    stages3.add(IconAnimationStage(
        color: Colors.redAccent,
        start: 1.0,
        end: 1.2,
        duration: Duration(milliseconds: 200)));
    stages3.add(IconAnimationStage(
        color: Colors.grey[100],
        start: 1.2,
        end: 1.0,
        duration: Duration(milliseconds: 200)));

    double iconSize = 90 * rpx;
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
                    backgroundImage: NetworkImage('${mainInfo.avatarUrl}'),
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
            txt: '${mainInfo.favCount}',
            icon: !provider.mainInfo.ifFaved
                ? AnimatedIconWidget(
                    key: UniqueKey(),
                    animationList: stages1,
                    icon: Icons.favorite,
                    size: iconSize,
                    provider: provider,
                    callback: () {
                      provider.tapFav();
                    },
                  )
                : AnimatedIconWidget(
                    key: UniqueKey(),
                    animationList: stages3,
                    icon: Icons.favorite,
                    size: iconSize,
                    provider: provider,
                    callback: () {
                      provider.tapFav();
                    },
                  )),
        IconText(
          txt: '${mainInfo.replyCount}',
          icon: AnimatedIconWidget(
            animationList: stages2,
            icon: Icons.comment,
            size: iconSize,
            callbackDelay: Duration(milliseconds: 80),
            callback: () {
              showBottom(context, provider);
            },
          ),
        ),
        IconText(
          txt: '${mainInfo.shareCount}',
          icon: AnimatedIconWidget(
            animationList: stages2,
            icon: Icons.reply,
            size: iconSize,
          ),
        ),
      ],
    );
  }
}

class IconText extends StatelessWidget {
  const IconText({Key key, this.icon, this.txt}) : super(key: key);
  final AnimatedIconWidget icon;
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

showBottom(context, provider) {
  double height = MediaQuery.of(context).size.height;
  provider.setScreenHeight(height);
  provider.hideBottom();
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      context: context,
      builder: (_) {
        return Container(
          height: 600,
          child: GestureDetector(
           onTap: (){
             FocusScope.of(context).requestFocus(FocusNode());
           }, 
           child: ReplyFullList(pCtx: context),
          ),
        );
      });
}
