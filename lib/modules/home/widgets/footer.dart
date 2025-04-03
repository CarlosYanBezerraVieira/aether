import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/core/ui/widgets/weather_info.dart';
import 'package:aether/core/ui/widgets/weather_tab.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final String feelsLike;
  final String wind;
  final String precipitation;
  final String humidity;
  final double height;
  const Footer(
      {super.key,
      required this.height,
      required this.feelsLike,
      required this.wind,
      required this.precipitation,
      required this.humidity});

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
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: WeatherInfo(
                      title: "Sensação Térmica",
                      subtitle: feelsLike,
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
                      subtitle: wind,
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
                      subtitle: precipitation,
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
                      subtitle: humidity,
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
