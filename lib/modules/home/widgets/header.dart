import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/core/ui/utils/app_images.dart';
import 'package:aether/core/ui/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  final String title;
  final String subtitle;
  const Header({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min, // Evita ocupar todo o espaço vertical
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                    fontSize: 14, color: CupertinoColors.systemGrey),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Button(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.add,
                  size: 24,
                  color: AppColor.textPrimaryColor,
                ),
              ),
              const SizedBox(
                width: 24,
              ),
              Button(
                  onPressed: () {},
                  child: SvgPicture.asset(
                    AppImages.textJustifyRight,
                    height: 14,
                    width: 14,
                    colorFilter: const ColorFilter.mode(
                      AppColor.textPrimaryColor,
                      BlendMode.srcIn,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
