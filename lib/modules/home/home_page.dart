import 'package:aether/core/helper/format_date.dart';
import 'package:aether/core/helper/format_speed.dart';
import 'package:aether/core/helper/format_temperature.dart';
import 'package:aether/core/helper/format_text.dart';
import 'package:aether/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:aether/modules/home/widgets/body.dart';
import 'package:aether/modules/home/widgets/footer.dart';
import 'package:aether/modules/home/widgets/header.dart';
import 'package:aether/core/ui/utils/app_color.dart';
import 'package:aether/core/ui/widgets/indicator_of_scroll.dart';
import 'package:aether/core/ui/widgets/show_temperature.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() {
      // ignore: use_build_context_synchronously
      Provider.of<HomeController>(context, listen: false).fetchWeather();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final bodyHeight = height * 0.5;
    final bottomHeight = height * 0.3;
    final horizontalSpace = -(width * 0.05);
    const indicatorScrollPadding = 16.0;
    final positionVerticalOfBody =
        (height - bodyHeight - bottomHeight - indicatorScrollPadding);

    return Consumer<HomeController>(
      builder: (context, homeController, child) {
        if (homeController.isLoading) {
          return Container(
            color: AppColor.catedralColor,
            child: const Center(
              child: CupertinoActivityIndicator(
                color: AppColor.textPrimaryColor,
                radius: 20,
              ),
            ),
          );
        }
        if (homeController.error != null) {
          return Container(
            color: AppColor.catedralColor,
            child: Center(
              child: Text(
                homeController.error!,
                style: const TextStyle(color: AppColor.textPrimaryColor),
              ),
            ),
          );
        }

        if (homeController.data.isEmpty) {
          return Container(
            color: AppColor.catedralColor,
            child: const Center(
              child: Text(
                'No data available',
                style: TextStyle(color: AppColor.textPrimaryColor),
              ),
            ),
          );
        }

        return Container(
          color: AppColor.catedralColor,
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                  right: horizontalSpace,
                  left: horizontalSpace,
                  top: positionVerticalOfBody,
                  child: Body(
                    height: bodyHeight,
                    width: width,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Header(
                          title: homeController.nameCity,
                          subtitle:
                              'Hoje ${FormatDate.formatTimeWithMonthDateAndHourMinute(
                            timezone: homeController.timezone,
                          )}',
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        ShowTemperature(
                          horizontalSpace: horizontalSpace,
                          temperature: FormatTemperature.formatTemperatureInCelsius(homeController.temperatureInKelvin,),
                          weatherTypeMain: FormatText.formatText(
                            homeController.weatherTypeMain,
                          ),
                          weatherTypeSecondary: FormatText.formatText(
                            homeController.weatherTypeSecondary,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        const IndicatorOfScroll(
                          selectedIndex: 0,
                        ),
                        Footer(
                          feelsLike: FormatTemperature.formatTemperatureInCelsiusWithString(homeController.feelsLike),
                          humidity: FormatText.formatNumberForPorcentage(homeController.humidity),
                          precipitation: FormatText.formatNumberForPorcentage(homeController.precipitation),
                          wind: FormatSpeed.formatSpeedInKilometersPerHour(homeController.windSpeed),
                          
                          height: bottomHeight,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
