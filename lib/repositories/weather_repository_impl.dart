// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:aether/core/network/htttp_client.dart';
import 'package:aether/models/lat_and_long_model.dart';
import 'package:aether/repositories/weather_repository.dart';

import '../models/weather_data_model.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final HttpClient httpClient;
  WeatherRepositoryImpl({
    required this.httpClient,
  });

  @override
  Future<WeatherData> getWeatherNow(
      {required LatAndLongModel latAndLongModel}) async {
    final response =
        await httpClient.get('/data/2.5/weather?${latAndLongModel.toString()}');
    return WeatherData.fromJson(response.body);
  }
}
