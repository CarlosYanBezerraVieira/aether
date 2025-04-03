class FormatText {
  static String formatText(String? text) {
    if (text == null || text.isEmpty) return '-';
    return text[0].toUpperCase() + text.substring(1);
  }

  static String formatNumberForPorcentage(num? number) {
    if (number == null) return '0%';
    return '${number.toStringAsFixed(0)}%';
  }
}
