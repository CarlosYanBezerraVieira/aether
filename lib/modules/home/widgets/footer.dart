import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/core/ui/widgets/animated_weather_group_of_info.dart';
import 'package:aether/core/ui/widgets/weather_tab.dart';
import 'package:aether/models/home/footer/weather_group_of_info_model.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final PageController pageControllerOfWeatherGroupOfInfo;
  final List<WeatherGroupOfInfoModel> weatherGroupOfInfoModels;
  final double height;
  const Footer({
    super.key,
    required this.height,
    required this.weatherGroupOfInfoModels,
    required this.pageControllerOfWeatherGroupOfInfo,
  });

  final double sizeOfTitleAndTab = 140;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Condições atuais',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColor.textPrimaryColor)),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            height: height - sizeOfTitleAndTab,
            width: width,
            child: AnimatedWeatherGroupOfInfo(
              pageController: pageControllerOfWeatherGroupOfInfo,
              weatherGroupOfInfoModels: weatherGroupOfInfoModels,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          WeatherTab(
            changeTab: (int index) {},
            selectedIndex: 0,
            labels: const [
              'Now',
              'Hourly',
              'Daily',
            ],
          )
        ],
      ),
    );
  }
}
