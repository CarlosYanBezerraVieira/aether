import 'package:aether/core/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';

class AnimatedDescriptionWeather extends StatelessWidget {
  final List<AnimatedDescriptionWeatherModel> listOfDescriptionWeather;
  final PageController pageController;

  const AnimatedDescriptionWeather({
    super.key,
    required this.listOfDescriptionWeather,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: 100,
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: listOfDescriptionWeather.length,
        controller: pageController,
        itemBuilder: (context, index) {
          final descriptionWeather = listOfDescriptionWeather[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                descriptionWeather.weatherTypeMain,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimaryColor,
                ),
              ),
              Text(
                descriptionWeather.weatherTypeSecondary,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimaryColor,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AnimatedDescriptionWeatherModel {
  final String weatherTypeMain;
  final String weatherTypeSecondary;

  AnimatedDescriptionWeatherModel({
    required this.weatherTypeMain,
    required this.weatherTypeSecondary,
  });
}
