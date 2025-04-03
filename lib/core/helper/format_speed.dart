class FormatSpeed {
  static String formatSpeedInKilometersPerHour(double speedInMetersPerSecond) {
  double speedInKmPerHour = speedInMetersPerSecond * 3.6;
  return "${speedInKmPerHour.toStringAsFixed(0)} km/h";
}
}