// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CloudsModel {
  final int all;

  CloudsModel({required this.all});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory CloudsModel.fromMap(Map<String, dynamic> map) {
    return CloudsModel(
      all: map['all'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CloudsModel.fromJson(String source) =>
      CloudsModel.fromMap(json.decode(source));
}
