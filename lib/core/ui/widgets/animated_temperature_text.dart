import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:aether/core/ui/utils/app_color.dart';

class AnimatedTemperatureText extends StatefulWidget {
  final int newTemperature;

  const AnimatedTemperatureText({
    super.key,
    required this.newTemperature,
  });

  @override
  State<AnimatedTemperatureText> createState() => _AnimatedTemperatureTextState();
}

class _AnimatedTemperatureTextState extends State<AnimatedTemperatureText> {
  late int _currentTemperature;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    final int temperatureAnimated = widget.newTemperature > 10 ? widget.newTemperature -5 : widget.newTemperature + 5;
    _currentTemperature = temperatureAnimated ;
    _startAnimation();
  }

  @override
  void didUpdateWidget(covariant AnimatedTemperatureText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.newTemperature != widget.newTemperature) {
      _timer?.cancel();
      _startAnimation();
    }
  }

  void _startAnimation() {
    int step = widget.newTemperature > _currentTemperature ? 1 : -1;

    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (_currentTemperature == widget.newTemperature) {
        timer.cancel();
      } else {
        setState(() {
          _currentTemperature += step;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_currentTemperature°',
      style: const TextStyle(
        fontSize: 98,
        fontWeight: FontWeight.bold,
        color: AppColor.textPrimaryColor,
      ),
    );
  }
}
