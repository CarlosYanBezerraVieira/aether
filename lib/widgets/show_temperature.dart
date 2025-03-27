import 'package:aether/ui/app_color.dart';
import 'package:flutter/cupertino.dart';

class ShowTemperature extends StatelessWidget {
  final double horizontalSpace;
  const ShowTemperature({super.key, required this.horizontalSpace});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
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
              const Text('Mostly',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textPrimaryColor,
                  )),
              const Text('cloudy',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColor.textPrimaryColor,
                  )),
            ],
          ),
          const Text('34°',
              style: TextStyle(
                fontSize: 98,
                fontWeight: FontWeight.bold,
                color: AppColor.textPrimaryColor,
              )),
        ],
      ),
    );
  }
}
