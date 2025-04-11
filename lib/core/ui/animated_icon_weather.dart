import 'package:aether/core/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';

class AnimatedIconWeather extends StatelessWidget {
  final PageController pageController;
  final List<IconData> listOfIconsWeather;
  final Duration animationDuration;

  const AnimatedIconWeather({
    super.key,
    required this.listOfIconsWeather,
    required this.pageController,
    this.animationDuration =
        const Duration(milliseconds: 700), // Reduz a duração
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: listOfIconsWeather.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Icon(
            listOfIconsWeather[index],
            size: 40,
            color: AppColor.textPrimaryColor,
          );
        },
      ),
    );
  }
}
