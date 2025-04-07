import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/modules/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../animated_controller.dart';

class VideoLoadingWrapper extends StatelessWidget {
  const VideoLoadingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AnimatedVideoController>(
      builder: (context, videoData, child) {
        if (videoData.controllers.isEmpty) {
          return Container(
            color: AppColor.catedralColor,
            child: const Center(
              child: CupertinoActivityIndicator(
                color: AppColor.textPrimaryColor,
                radius: 20,
              ),
            ),
          );
        } else {
          return HomePage(controllers: videoData.controllers); // Passe os controllers
        }
      },
    );
  }
}