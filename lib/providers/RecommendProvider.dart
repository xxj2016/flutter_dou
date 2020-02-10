import 'package:flutter/material.dart';

class RecommendProvider extends State<StatefulWidget>
    with ChangeNotifier, TickerProviderStateMixin {
  bool ifShowBottom = true;
  double screenHeight;
  
  TabController controller;
  MainInfo mainInfo;
  Reply reply;

  RecommendProvider() {
    controller = TabController(vsync: this, length: 2);
    mainInfo = MainInfo(
      avatarUrl:
          "http://p1.music.126.net/sN3DmCp_EU0Zx14P40cR-w==/2765271743870112.jpg?param=180y180",
      content: "要明换饭忘尔各穿这况步念加。务卫识画成？式故阿花色块派州世往杰位浪两洗。木路神？耳据轻州意情部！啊饭没急洛智印府坚断专！",
      favCount: 109,
      replyCount: 212,
      shareCount: 213,
      userName: "Jet",
      videoPath:
          "https://c-ssl.duitang.com/uploads/item/201207/20/20120720152956_3MF8v.thumb.700_0.jpeg",
      desc: "包义命数期很台张幸州福白放百酒板您你？！",
      ifFaved: false,
    );

    reply = Reply(
      ifFaved: true,
      afterReplies: List<Reply>(),
      replyContent: "钩水鸡，哩唔直",
      replyMakerAvatar:
          'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=381337789,1658125787&fm=26&gp=0.jpg',
      replyMakerName: '2019.02.10看',
      whenReplied: '3小时前',
    );
  }

  setScreenHeight(height) {
    screenHeight = height;
    notifyListeners();

  }

  hideBottom() {
    ifShowBottom = false;
    notifyListeners();
  }

  tapFav() {
    mainInfo.ifFaved = !mainInfo.ifFaved;
    if (mainInfo.ifFaved) {
      mainInfo.favCount += 1;
    } else {
      mainInfo.favCount -= 1;
    }
    notifyListeners();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}

class MainInfo {
  String avatarUrl;
  String userName;
  String content;
  int favCount;
  int replyCount;
  int shareCount;
  String videoPath;
  String desc;
  bool ifFaved;

  MainInfo(
      {this.avatarUrl,
      this.content,
      this.favCount,
      this.replyCount,
      this.shareCount,
      this.userName,
      this.videoPath,
      this.desc,
      this.ifFaved});
}

class Reply {
  String replyMakerName;
  String replyMakerAvatar;
  String replyContent;
  String whenReplied;
  bool ifFaved;
  List<Reply> afterReplies;

  Reply({
    this.replyMakerName,
    this.replyMakerAvatar,
    this.replyContent,
    this.whenReplied,
    this.ifFaved,
    this.afterReplies,
  });
}
