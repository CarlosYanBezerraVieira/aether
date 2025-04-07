// lib/providers/video_provider.dart
import 'package:video_player/video_player.dart';

class AnimatedVideoController {
  final List<VideoPlayerController> controllers;

  AnimatedVideoController({required this.controllers});
}

class AnimatedVideoData {
  static Future<AnimatedVideoController> loadVideos() async {
    final paths = [
      'assets/places/catedral.mp4',
      'assets/places/coliseu.mp4',
      'assets/places/estatua.mp4',
    ];

    final controllers = await Future.wait(paths.map((path) async {
      final controller = VideoPlayerController.asset(path);
      await controller.initialize();
      controller.setLooping(true);
      return controller;
    }));

    return AnimatedVideoController(controllers: controllers);
  }
}