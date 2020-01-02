import 'package:flutter/material.dart';

class RecommendProvider with ChangeNotifier {
  MainInfo mainInfo = MainInfo (
    avatarUrl: "http://p1.music.126.net/sN3DmCp_EU0Zx14P40cR-w==/2765271743870112.jpg?param=180y180",
    content: "要明换饭忘尔各穿这况步念加。务卫识画成？式故阿花色块派州世往杰位浪两洗。木路神？耳据轻州意情部！啊饭没急洛智印府坚断专！",
    favCount: 109,
    replyCount: 212,
    shareCount: 213,
    userName: "Jet",
    videoPath: "https://c-ssl.duitang.com/uploads/item/201207/20/20120720152956_3MF8v.thumb.700_0.jpeg",
    desc: "包义命数期很台张幸州福白放百酒板您你？！",
    ifFaved: false,
  );

  tapFav() {
    mainInfo.ifFaved = !mainInfo.ifFaved;
    if(mainInfo.ifFaved) {
      mainInfo.favCount += 1;
    } else {
      mainInfo.favCount -= 1;
    }
    notifyListeners();
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

  MainInfo({this.avatarUrl, this.content, this.favCount, this.replyCount, this.shareCount, this.userName, this.videoPath, this.desc, this.ifFaved});
}