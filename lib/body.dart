import 'package:aether/animated_video.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  final double width;
  final double height;
  const Body({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: const AnimatedVideo(
        path: 'assets/places/catedral.mp4',
      ),
    );
  }
}
