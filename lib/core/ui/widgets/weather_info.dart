import 'package:aether/core/ui/utils/app_color.dart';
import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final Widget? icon;
  final String title;
  final String subtitle;
  const WeatherInfo(
      {super.key,
      required this.icon,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColor.footerMensureBackgroundColor,
          child: icon,
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$title ",
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColor.textSecondaryColor)),
            const SizedBox(height: 4),
            Text(subtitle,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColor.textPrimaryColor)),
          ],
        ),
      ],
    );
  }
}
