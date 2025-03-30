// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SysModel {
  final int type;
  final int id;
  final String country;
  final int sunrise;
  final int sunset;

  SysModel(
      {required this.type,
      required this.id,
      required this.country,
      required this.sunrise,
      required this.sunset});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }

  factory SysModel.fromMap(Map<String, dynamic> map) {
    return SysModel(
      type: map['type'] ?? 0,
      id: map['id'] ?? 0,
      country: map['country'] ?? '',
      sunrise: map['sunrise'] ?? 0,
      sunset: map['sunset'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory SysModel.fromJson(String source) =>
      SysModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
