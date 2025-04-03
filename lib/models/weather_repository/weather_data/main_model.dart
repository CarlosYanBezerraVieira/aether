// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MainModel {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  MainModel({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
    required this.seaLevel,
    required this.grndLevel,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }

  factory MainModel.fromMap(Map<String, dynamic> map) {
    return MainModel(
      temp: map['temp']?.toDouble() ?? 0.0,
      feelsLike: map['feels_like']?.toDouble() ?? 0.0,
      tempMin: map['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['temp_max']?.toDouble() ?? 0.0,
      pressure: map['pressure'] ?? 0,
      humidity: map['humidity'] ?? 0,
      seaLevel: map['sea_level'] ?? 0,
      grndLevel: map['grnd_level'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory MainModel.fromJson(String source) =>
      MainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
