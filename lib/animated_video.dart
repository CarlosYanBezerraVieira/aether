import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimatedVideo extends StatefulWidget {
  final String path;
  const AnimatedVideo({super.key, required this.path});

  @override
  AnimatedVideoState createState() => AnimatedVideoState();
}

class AnimatedVideoState extends State<AnimatedVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    //TODO carregar video logo no comeco do app
    super.initState();
    _controller =
        VideoPlayerController.asset(widget.path) // Substitua pelo seu vídeo
          ..initialize().then((_) {
            // Garante que a primeira frame é mostrada após a inicialização
            setState(() {
              _controller.setLooping(true); // Loop infinito
              _controller.play();
            });
          });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _controller.value.isInitialized,
      replacement: const CircularProgressIndicator(),
      child: VideoPlayer(_controller), // Mostra um indicador de carregamento
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
