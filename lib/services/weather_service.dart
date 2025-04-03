import 'package:aether/models/home/eather_model.dart';
import 'package:aether/models/weather_repository/lat_and_long_model.dart';

abstract class WeatherService {
  Future<EatherModel> getWeatherNow({required LatAndLongModel latAndLongModel});
}
