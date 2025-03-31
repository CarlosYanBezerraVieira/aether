class EatherModel {
  final double temperature;
  final String weatherTypeMain;
  final String weatherTypeSecondary;
  final String nameCity;
  final int timezone;
  EatherModel({
    required this.temperature,
    required this.weatherTypeMain,
    required this.weatherTypeSecondary,
    required this.nameCity,
    required this.timezone,
  });
}
