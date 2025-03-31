import 'package:aether/models/eather_model.dart';
import 'package:aether/models/lat_and_long_model.dart';

abstract class WeatherService {
  Future<EatherModel> getWeatherNow({required LatAndLongModel latAndLongModel});
}
