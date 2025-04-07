import 'package:aether/modules/animated_video/animated_video.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class Body extends StatelessWidget {
  final Function(int) onPageChanged;
  final List<VideoPlayerController> controllers;
  final double width;
  final double height;
  const Body(
      {super.key,
      required this.width,
      required this.height,
      required this.onPageChanged,
      required this.controllers});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: PageView(
          onPageChanged: onPageChanged,
          children: controllers.map((controller) {
            return AnimatedVideo(controller: controller);
          }).toList(),
        ));
  }
}
