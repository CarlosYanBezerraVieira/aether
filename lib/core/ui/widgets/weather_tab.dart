import 'package:aether/core/ui/utils/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class WeatherTab extends StatelessWidget {
  final int selectedIndex;
  final List<String> labels;
  final Function(int index) changeTab;
  const WeatherTab({
    super.key,
    required this.selectedIndex,
    required this.labels,
    required this.changeTab,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: 2,
            decoration: BoxDecoration(
              color: AppColor.footerMensureBackgroundColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(labels.length, (index) {
            final textPainter = TextPainter(
              text: TextSpan(
                text: labels[index],
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              maxLines: 1,
              textDirection: TextDirection.ltr,
            )..layout();
            return GestureDetector(
              onTap: () {
                changeTab(index);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 3,
                    width: selectedIndex == index ? textPainter.width + 12 : 0,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColor.textPrimaryColor
                          : AppColor
                              .transparent, // Invisível para os não selecionados
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    width: textPainter.width,
                    child: Text(
                      labels[index],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? AppColor.textPrimaryColor
                            : AppColor.textSecondaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}
