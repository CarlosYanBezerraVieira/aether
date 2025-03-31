class FormatText {
  static String formatText(String? text) {
    if (text == null || text.isEmpty) return '-';
    return text[0].toUpperCase() + text.substring(1);
  }
}
