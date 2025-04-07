// lib/core/ui/widgets/animated_video.dart
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimatedVideo extends StatefulWidget {
  final VideoPlayerController controller;

  const AnimatedVideo({super.key, required this.controller});

  @override
  AnimatedVideoState createState() => AnimatedVideoState();
}

class AnimatedVideoState extends State<AnimatedVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Inicia a reprodução quando o widget se torna visível
    _controller.play();
  }

  @override
  void deactivate() {
    // Para a reprodução quando o widget não está mais visível
    _controller.pause();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _controller.value.isInitialized,
      replacement: const CircularProgressIndicator(),
      child: VideoPlayer(_controller),
    );
  }
}