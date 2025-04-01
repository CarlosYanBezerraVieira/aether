import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/core/ui/widgets/button.dart';
import 'package:aether/core/ui/widgets/weather_info.dart';
import 'package:aether/core/ui/widgets/weather_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final double height;
  const Footer({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Clima Agora',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColor.textPrimaryColor)),
              Button(
                  child: const Icon(
                    CupertinoIcons.chevron_down,
                    size: 24,
                    color: AppColor.textPrimaryColor,
                  ),
                  onPressed: () {})
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                    title: "Feels Like",
                    subtitle: "34°",
                    icon: Text(
                      '°C',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColor.textPrimaryColor,
                      ),
                    ),
                  ),
                  WeatherInfo(
                    title: "Wind",
                    subtitle: "10 km/h",
                    icon: Icon(
                      CupertinoIcons.wind,
                      color: AppColor.textPrimaryColor,
                      size: 24,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WeatherInfo(
                    title: "Precipitation",
                    subtitle: "50%",
                    icon: Icon(
                      CupertinoIcons.umbrella,
                      color: AppColor.textPrimaryColor,
                      size: 24,
                    ),
                  ),
                  WeatherInfo(
                    title: "Humidity",
                    subtitle: "80%",
                    icon: Icon(
                      CupertinoIcons.drop,
                      color: AppColor.textPrimaryColor,
                      size: 24,
                    ),
                  )
                ],
              )
            ],
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
