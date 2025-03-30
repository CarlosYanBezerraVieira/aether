// ignore_for_file: public_member_api_docs, sort_constructors_first
class LatAndLongModel {
  final double lat;
  final double long;

  LatAndLongModel({
    required this.lat,
    required this.long,
  });

  @override
  String toString() => 'lat=$lat&lon=$long';
}
