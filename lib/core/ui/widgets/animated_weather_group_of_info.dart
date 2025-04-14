import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/core/ui/widgets/weather_info.dart';
import 'package:aether/models/home/footer/weather_group_of_info_model.dart';
import 'package:flutter/cupertino.dart';

class AnimatedWeatherGroupOfInfo extends StatelessWidget {
  final PageController pageController;
  final List<WeatherGroupOfInfoModel> weatherGroupOfInfoModels;

  const AnimatedWeatherGroupOfInfo({
    super.key,
    required this.weatherGroupOfInfoModels,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: pageController,
      itemCount: weatherGroupOfInfoModels.length,
      itemBuilder: (context, index) {
        final weatherGroupOfInfoModel = weatherGroupOfInfoModels[index];
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: WeatherInfo(
                    title: "Sensação Térmica",
                    subtitle: weatherGroupOfInfoModel.feelsLike,
                    icon: const Text(
                      '°C',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textPrimaryColor,
                      ),
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: WeatherInfo(
                    title: "Vento",
                    subtitle: weatherGroupOfInfoModel.wind,
                    icon: const Icon(
                      CupertinoIcons.wind,
                      color: AppColor.textPrimaryColor,
                      size: 24,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: WeatherInfo(
                    title: "Precipitação",
                    subtitle: weatherGroupOfInfoModel.precipitation,
                    icon: const Icon(
                      CupertinoIcons.umbrella,
                      color: AppColor.textPrimaryColor,
                      size: 24,
                    ),
                  ),
                ),
                const Spacer(flex: 1),
                Expanded(
                  flex: 2,
                  child: WeatherInfo(
                    title: "Húmidade",
                    subtitle: weatherGroupOfInfoModel.humidity,
                    icon: const Icon(
                      CupertinoIcons.drop,
                      color: AppColor.textPrimaryColor,
                      size: 24,
                    ),
                  ),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
