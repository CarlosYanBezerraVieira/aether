import 'package:aether/models/home/eather_model.dart';
import 'package:aether/services/weather_service.dart';
import 'package:flutter/foundation.dart';
import '../../models/weather_repository/lat_and_long_model.dart';

class HomeController extends ChangeNotifier {
  final WeatherService _weatherService;

  List<EatherModel> _data = [
    EatherModel(
        temperature: 273.15,
        weatherTypeMain: 'Um pouco',
        weatherTypeSecondary: 'nublado',
        timezone: 0,
        nameCity: 'Juazeiro do Norte')
  ];
  bool _isLoading = false;
  String? _error;

  HomeController({
    required WeatherService weatherService,
  }) : _weatherService = weatherService;

  List<EatherModel> get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final places = <LatAndLongModel>[
    LatAndLongModel(lat: 37.7749, long: -122.4194), // San Francisco
    LatAndLongModel(lat: 34.0522, long: -118.2437), // Los Angeles
    LatAndLongModel(lat: 40.7128, long: -74.0060), // New York
    LatAndLongModel(lat: 41.8781, long: -87.6298), // Chicago
    LatAndLongModel(lat: 51.5074, long: -0.1278), // London
  ];

  int get timezone => data.first.timezone;

  String get weatherTypeMain => data.first.weatherTypeMain;
  String get weatherTypeSecondary => data.first.weatherTypeSecondary;

  String get temperatureInCelsius {
    // 1. Converter a temperatura de Kelvin para Celsius
    double kelvinTemperature = data.first.temperature;
    double celsiusTemperature = kelvinTemperature - 273.15;

    // 2. Formatar a temperatura em Celsius arredondando para o número inteiro mais próximo
    String formattedTemperature = celsiusTemperature.round().toString();

    return '$formattedTemperature°';
  }

  String get nameCity => data.first.nameCity;

  Future<void> fetchWeather() async {
    _isLoading = true;
    notifyListeners();

    try {
      await Future.wait(places.map((place) async {
        final weatherData =
            await _weatherService.getWeatherNow(latAndLongModel: place);
        _data.add(weatherData);
      }));

      _error = null;
    } catch (e) {
      _error = e.toString();
      _data = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
