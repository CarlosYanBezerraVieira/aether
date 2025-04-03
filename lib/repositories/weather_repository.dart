import 'package:aether/models/weather_repository/lat_and_long_model.dart';
import 'package:aether/models/weather_repository/weather_data_model.dart';

abstract class WeatherRepository {
  Future<WeatherData> getWeatherNow({required LatAndLongModel latAndLongModel});
}
