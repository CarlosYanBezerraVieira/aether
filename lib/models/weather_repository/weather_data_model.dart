// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:aether/models/weather_repository/weather_data/clouds_model.dart';
import 'package:aether/models/weather_repository/weather_data/coord_model.dart';
import 'package:aether/models/weather_repository/weather_data/rain_model.dart';
import 'package:aether/models/weather_repository/weather_data/sys_model.dart';
import 'package:aether/models/weather_repository/weather_data/weather_model.dart';
import 'package:aether/models/weather_repository/weather_data/wind.dart';

import 'weather_data/main_model.dart';

class WeatherData {
  final CoordModel coord;
  final List<WeatherModel> weather;
  final String base;
  final MainModel main;
  final int visibility;
  final WindModel wind;
  final RainModel? rain;
  final CloudsModel clouds;
  final int dt;
  final SysModel sys;
  final int timezone;
  final int id;
  final String name;
  final int cod;

  WeatherData({
    required this.coord,
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    this.rain,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  factory WeatherData.fromMap(Map<String, dynamic> map) {
    return WeatherData(
      coord: CoordModel.fromMap(map['coord']),
      weather:
          (map['weather'] as List).map((i) => WeatherModel.fromMap(i)).toList(),
      base: map['base'] ?? "",
      main: MainModel.fromMap(map['main']),
      visibility: map['visibility'] ?? 0,
      wind: WindModel.fromMap(map['wind']),
      rain: map['rain'] != null ? RainModel.fromMap(map['rain']) : null,
      clouds: CloudsModel.fromMap(map['clouds']),
      dt: map['dt'] ?? 0,
      sys: SysModel.fromMap(map['sys']),
      timezone: map['timezone'] ?? 0,
      id: map['id'] ?? 0,
      name: map['name'] ?? "",
      cod: map['cod'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord.toMap(),
      'weather': weather.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main.toMap(),
      'visibility': visibility,
      'wind': wind.toMap(),
      'rain': rain?.toMap(),
      'clouds': clouds.toMap(),
      'dt': dt,
      'sys': sys.toMap(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  String toJson() => json.encode(toMap());

  factory WeatherData.fromJson(String source) =>
      WeatherData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherData(coord: $coord, weather: $weather, base: $base, main: $main, visibility: $visibility, wind: $wind, rain: $rain, clouds: $clouds, dt: $dt, sys: $sys, timezone: $timezone, id: $id, name: $name, cod: $cod)';
  }
}
