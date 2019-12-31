import 'package:flutter/material.dart';

class RotateAlbum extends StatefulWidget {
  RotateAlbum({Key key}) : super(key: key);

  @override
  _RotateAlbumState createState() => _RotateAlbumState();
}

class _RotateAlbumState extends State<RotateAlbum>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;
  var avatarImage = 'http://p1.music.126.net/sN3DmCp_EU0Zx14P40cR-w==/2765271743870112.jpg?param=180y180';
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    animation = RotationTransition(
      turns: Tween(begin: 0.0, end: 1.0).animate(_controller)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.forward(from: 0.0);
          }
        }),
      // child: Icon(Icons.music_note),
      // child: CircleAvatar(child: Image.network('http://p1.music.126.net/sN3DmCp_EU0Zx14P40cR-w==/2765271743870112.jpg?param=180y180'),)
      child: CircleAvatar(
        backgroundImage: NetworkImage(avatarImage),
      ),
    );
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: animation,
    );
  }
}
