import 'package:aether/animated_video.dart';
import 'package:aether/ui/app_color.dart';
import 'package:aether/ui/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ).copyWith(top: 32),
        color: AppColor.catedralColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    mainAxisSize:
                        MainAxisSize.min, // Evita ocupar todo o espaço vertical
                    children: [
                      Text(
                        'Título Principal',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Subtítulo menor',
                        style: TextStyle(
                            fontSize: 14, color: CupertinoColors.systemGrey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: const Icon(
                          CupertinoIcons.add,
                          color: AppColor.textPrimaryColor,
                        ),
                      ),
                      CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: SvgPicture.asset(
                            AppImages.textJustifyRight,
                            height: 14,
                            width: 14,
                            colorFilter: const ColorFilter.mode(
                              AppColor.textPrimaryColor,
                              BlendMode.srcIn,
                            ),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 400,
                width: 500,
                child: AnimatedVideo(
                  path: 'assets/places/catedral.mp4',
                ),
              ),
              const Placeholder(
                fallbackHeight: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
