import 'package:aether/body.dart';
import 'package:aether/footer.dart';
import 'package:aether/header.dart';
import 'package:aether/ui/app_color.dart';
import 'package:aether/widgets/indicator_of_scroll.dart';
import 'package:aether/widgets/show_temperature.dart';
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
    const indicatorScrollPadding = 16.0;
    final positionVerticalOfBody =
        (height - bodyHeight - bottomHeight - indicatorScrollPadding);
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
                  Column(
                    children: [
                      const Header(),
                      const SizedBox(
                        height: 32,
                      ),
                      ShowTemperature(horizontalSpace: horizontalSpace)
                    ],
                  ),
                  Column(
                    children: [
                      const IndicatorOfScroll(
                        selectedIndex: 0,
                      ),
                      Footer(
                        height: bottomHeight,
                      ),
                    ],
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
