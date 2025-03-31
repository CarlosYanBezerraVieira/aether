import 'package:aether/core/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';

class ShowTemperature extends StatelessWidget {
  final String temperature;
  final String weatherTypeMain;
  final String weatherTypeSecondary;
  final double horizontalSpace;
  const ShowTemperature(
      {super.key,
      required this.horizontalSpace,
      required this.temperature,
      required this.weatherTypeMain,
      required this.weatherTypeSecondary});

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
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.cloud_sun,
                  size: 40,
                  color: AppColor.textPrimaryColor,
                ),
              ),
              Text(weatherTypeMain,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textPrimaryColor,
                  )),
              Text(weatherTypeSecondary,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textPrimaryColor,
                  )),
            ],
          ),
          Text(temperature,
              style: const TextStyle(
                fontSize: 98,
                fontWeight: FontWeight.bold,
                color: AppColor.textPrimaryColor,
              )),
        ],
      ),
    );
  }
}
