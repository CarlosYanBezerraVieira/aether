// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CoordModel {
  final double lon;
  final double lat;

  CoordModel({required this.lon, required this.lat});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory CoordModel.fromMap(Map<String, dynamic> map) {
    return CoordModel(
      lon: map['lon'] ?? 0.0,
      lat: map['lat'] ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordModel.fromJson(String source) =>
      CoordModel.fromMap(json.decode(source));
}
