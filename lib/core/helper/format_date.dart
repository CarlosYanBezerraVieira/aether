import 'package:intl/intl.dart';

class FormatDate {
  static String formatTimeWithMonthDateAndHourMinute({required int timezone}) {
    // 1. Converter o timestamp Unix para DateTime em UTC
    DateTime utcTime = DateTime.now().toUtc();
    // 2. Adicionar o deslocamento de fuso horário para obter a hora local
    DateTime localTime = utcTime.add(Duration(seconds: timezone));

    // 3. Formatar o objeto DateTime para exibir a hora local
    String formattedTime = DateFormat('MMM dd HH:mm').format(localTime);

    return formattedTime;
  }
}
