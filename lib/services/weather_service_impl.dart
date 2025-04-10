// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:aether/models/home/eather_model.dart';
import 'package:aether/models/weather_repository/lat_and_long_model.dart';
import 'package:aether/repositories/weather_repository.dart';
import 'package:aether/services/weather_service.dart';

class WeatherServiceImpl implements WeatherService {
  final WeatherRepository weatherRepository;
  WeatherServiceImpl({
    required this.weatherRepository,
  });

  @override
  Future<EatherModel> getWeatherNow(
      {required LatAndLongModel latAndLongModel}) async {
    final response =
        await weatherRepository.getWeatherNow(latAndLongModel: latAndLongModel);
    final description = response.weather[0].description;
    final weatherTypeMain = description.split(' ').first;
    final weatherTypeSecondary = description.split(' ').last;
    return EatherModel(
      temperature: response.main.temp,
      weatherTypeMain: weatherTypeMain,
      weatherTypeSecondary: weatherTypeSecondary,
      nameCity: response.name,
      timezone: response.timezone,
      feelsLike: response.main.feelsLike,
      humidity: response.main.humidity,
      precipitation: response.rain?.oneHour ?? 0.0,
      windSpeed: response.wind.speed,
    );
  }
}
