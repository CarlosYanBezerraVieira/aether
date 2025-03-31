// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WindModel {
  final double speed;
  final int deg;
  final double gust;

  WindModel({required this.speed, required this.deg, required this.gust});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'speed': speed,
      'deg': deg,
      'gust': gust,
    };
  }

  factory WindModel.fromMap(Map<String, dynamic> map) {
    return WindModel(
      speed: map['speed']?.toDouble() ?? 0.0,
      deg: map['deg'] ?? 0,
      gust: map['gust']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory WindModel.fromJson(String source) =>
      WindModel.fromMap(json.decode(source));
}
