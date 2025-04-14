import 'package:aether/models/home/eather_model.dart';
import 'package:aether/services/weather_service.dart';
import 'package:flutter/foundation.dart';
import '../../models/weather_repository/lat_and_long_model.dart';

class HomeController extends ChangeNotifier {
  final WeatherService _weatherService;

  List<EatherModel> _data = [];
  bool _isLoading = false;
  String? _error;

  HomeController({
    required WeatherService weatherService,
  }) : _weatherService = weatherService;

  List<EatherModel> get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  int _currentPage = 0;
  int get currentPage => _currentPage;

  void setCurrentPage(int index) {
    _currentPage = index;
    notifyListeners();
  }

  final places = <LatAndLongModel>[
    LatAndLongModel(lat: 37.7749, long: -122.4194), // San Francisco
    LatAndLongModel(lat: 34.0522, long: -118.2437), // Los Angeles
    LatAndLongModel(lat: 40.7128, long: -74.0060), // New York
    LatAndLongModel(lat: 41.8781, long: -87.6298), // Chicago
    LatAndLongModel(lat: 51.5074, long: -0.1278), // London
  ];

  int get timezone => data[currentPage].timezone;
  double get temperatureInKelvin => data[currentPage].temperature;
  String get weatherTypeMain => data[currentPage].weatherTypeMain;
  String get weatherTypeSecondary => data[currentPage].weatherTypeSecondary;

  String get nameCity => data[currentPage].nameCity;

  double get feelsLike => data[currentPage].feelsLike;
  int get humidity => data[currentPage].humidity;
  double get windSpeed => data[currentPage].windSpeed;
  double get precipitation => data[currentPage].precipitation;

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
