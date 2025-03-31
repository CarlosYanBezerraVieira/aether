// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RainModel {
  final double oneHour;

  RainModel({required this.oneHour});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'oneHour': oneHour,
    };
  }

  factory RainModel.fromMap(Map<String, dynamic> map) {
    return RainModel(
      oneHour: map['oneHour']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RainModel.fromJson(String source) =>
      RainModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
