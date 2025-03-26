import 'package:aether/body.dart';
import 'package:aether/footer.dart';
import 'package:aether/header.dart';
import 'package:aether/ui/app_color.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final bodyHeight = height * 0.5;
    final bottomHeight = height * 0.3;
    final horizontalSpace = -(width * 0.05);
    final positionVerticalOfBody = (height - bodyHeight - bottomHeight) / 2;
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        color: AppColor.catedralColor,
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: horizontalSpace,
                left: horizontalSpace,
                top: positionVerticalOfBody,
                child: Body(
                  height: bodyHeight,
                  width: width,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Header(),
                  Footer(
                    height: bottomHeight,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
