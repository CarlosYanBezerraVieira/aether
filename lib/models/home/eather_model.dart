class EatherModel {
  final double temperature;
  final String weatherTypeMain;
  final String weatherTypeSecondary;
  final String nameCity;
  final int timezone;
  final double feelsLike;
  final int humidity;
  final double precipitation;
  final double windSpeed;
  EatherModel({
    required this.temperature,
    required this.weatherTypeMain,
    required this.weatherTypeSecondary,
    required this.nameCity,
    required this.timezone,
    required this.feelsLike,
    required this.humidity,
    required this.precipitation,
    required this.windSpeed,
  });
}
