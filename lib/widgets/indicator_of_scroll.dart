import 'package:aether/ui/app_color.dart';
import 'package:flutter/material.dart';

class IndicatorOfScroll extends StatelessWidget {
  final int selectedIndex;
  const IndicatorOfScroll({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              3,
              (index) => Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? AppColor.textPrimaryColor
                          : AppColor.textTertiaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  )),
        ],
      ),
    );
  }
}
