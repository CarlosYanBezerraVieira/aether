import 'package:aether/ui/app_color.dart';
import 'package:aether/ui/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).copyWith(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize:
                MainAxisSize.min, // Evita ocupar todo o espaço vertical
            children: [
              Text(
                'Título Principal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Subtítulo menor',
                style:
                    TextStyle(fontSize: 14, color: CupertinoColors.systemGrey),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.add,
                  size: 24,
                  color: AppColor.textPrimaryColor,
                ),
              ),
              CupertinoButton(
                  padding: EdgeInsets.zero,
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
