import 'package:aether/core/ui/animated_description_weather.dart';
import 'package:flutter/cupertino.dart';

import '../animated_icon_weather.dart';
import 'animated_temperature_text.dart';

class ShowTemperature extends StatelessWidget {
  final int temperature;
  final List<AnimatedDescriptionWeatherModel> listOfDescriptionWeather;
  final List<IconData> listOfIconsWeather;
  final PageController pageControllerOfDescriptionWeather;
  final PageController pageControllerOfIconWeather;
  const ShowTemperature(
      {super.key,
      required this.temperature,
      y,
      required this.listOfDescriptionWeather,
      required this.listOfIconsWeather,
      required this.pageControllerOfDescriptionWeather,
      required this.pageControllerOfIconWeather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedIconWeather(
                  listOfIconsWeather: listOfIconsWeather,
                  pageController:pageControllerOfIconWeather ),
           
              AnimatedDescriptionWeather(
                  pageController: pageControllerOfDescriptionWeather,
                  listOfDescriptionWeather: listOfDescriptionWeather)
            ],
          ),
          AnimatedTemperatureText(
            newTemperature: temperature,
          ),
        ],
      ),
    );
  }
}
